class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    authorize! :show, Document
    
    @documents = @review.documents
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    authorize! :show, Document
    
    add_recent_item(@document)
  end

  # GET /documents/new
  def new
    authorize! :manage, Document
    
    @document = Document.new
    @document.review = @review
  end

  # GET /documents/1/edit
  def edit
    authorize! :manage, Document
    
  end

  # POST /documents
  # POST /documents.json
  def create
    authorize! :manage, Document
    
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    authorize! :manage, Document
    
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to documents_path, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize! :manage, Document
    
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_path, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(
        :document_type_id,
        :review_id,
        :name,
        :url,
        :is_enabled
        )
    end
end
