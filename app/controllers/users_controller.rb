class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :send_welcome_email], if: -> { params[:id].is_a?(Numeric) || params[:id] != "sign_out" }

  def impersonate
    authorize! :manage, User
     
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end

  # GET /users
  # GET /users.json
  def index
    authorize! :show, User
     
    @users = current_user.customer.users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize! :show, User
  end

  # GET /users/new
  def new
    authorize! :manage, User
    
    @user = User.new
    @user.customer=current_user.customer
    @user.role=Role.find(5) #Viewer
    
  end

  # GET /users/1/edit
  def edit
     authorize! :manage, @user
     
  end
  
  def notebook
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    authorize! :manage, User
     
    @user = User.new(user_params)
      begin
        if @user.save(validate: false)
         redirect_to users_path, notice: 'User created'
        else
         redirect_to users_path, alert: @user.errors
        end
      rescue ActiveRecord::RecordNotUnique => e
         redirect_to users_path, alert: 'User already exists, please use a different email'
      rescue Exception => e
         redirect_to users_path, alert: e.message
      end  
  end

  def send_welcome_email
    authorize! :show, User
    
    raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = hashed_token
    @user.reset_password_sent_at = Time.now.utc
    @user.save
    
    @url=request.base_url + '/users/password/edit?reset_password_token=' + raw_token
    
    ApplicationMailer.welcome_email(@user, @url).deliver
    redirect_to users_url, notice: 'Welcome email sent!'
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :edit, @user
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize! :manage, User
    
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :customer_id,
        :role_id,
        :is_enabled,
        :first_name,
        :last_name,
        :email,
        :notes,
        :phone
        )
    end
end
