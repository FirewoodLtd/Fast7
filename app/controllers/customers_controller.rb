class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :join]

  # GET /customers
  # GET /customers.json
  def index
    authorize! :show, Customer
    
    @customers = Customer.all.order(name: :asc)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    authorize! :show, Customer
    
  end

  # GET /customers/new
  def new
    authorize! :manage, Customer
    
    @customer = Customer.new
    @templates = Template.all.order(:name)
    @frameworks = Category.roots.order(:name) #only return level 0 categories (frameworks)
  end

  # GET /customers/1/edit
  def edit
    authorize! :manage, Customer
    @templates = Template.all.order(:name)
    @frameworks = Category.roots.order(:name) #only return level 0 categories (frameworks)    
    
  end
  
  def join
    authorize! :manage, Customer
    
    current_user.customer=@customer
    session.delete(:review_id)
    if current_user.save
      redirect_to root_url, notice: "Joined account successfully"
    else
      redirect_to @customer, notice: "Error joining account"
    end
  end
  

  # POST /customers
  # POST /customers.json
  def create
    authorize! :manage, Customer
    
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    authorize! :manage, Customer
    
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    authorize! :manage, Customer
    
    @customer.destroy
    
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id]) if params[:id]
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(
        :name,
        :is_enabled,
        :address,
        :registration_num,
        :logo_url,
        :contact_main_name,
        :contact_main_title,
        :contact_main_address,
        :contact_main_phone,
        :contact_main_email,
        :contact_billing_name,
        :contact_billing_title,
        :contact_billing_address,
        :contact_billing_phone,
        :contact_billing_email,
        :contact_technical_name,
        :contact_technical_title,
        :contact_technical_address,
        :contact_technical_phone,
        :contact_technical_email,
        :tier,
        :max_projects,
        :max_reviews,
        :max_frameworks,
        :allow_custom_frameworks,
        :expires_at,
        :template_ids => [],
        :category_ids => []
        )
    end
end
