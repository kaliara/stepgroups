class Admin::DocumentsController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']
  layout 'admin'

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new
    @document.document_type = 1

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    @transactions = @document.transactions
    @untied_transactions = Transaction.where('document_id is null').order('timestamp asc')
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])

    respond_to do |format|
      if @document.save
        format.html { redirect_to edit_admin_document_path(@document), notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
        format.js   { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to edit_admin_document_path(@document), notice: 'Document was successfully updated.' }
        format.js   { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to admin_documents_path }
      format.json { head :no_content }
      format.js   { head :no_content }
    end
  end
  
  def add_transaction
    @transactions = Transaction.where('document_id is null').order('timestamp asc')
    
    respond_to do |format|
      format.html { redirect_to admin_transactions_path }
      format.js   { render :action => 'transactions' }
    end
  end

  def update_transaction
    @transaction = Transaction.find(params[:id])
    @transaction.update_attribute(:document_id, params[:document_id])
        
    respond_to do |format|
      format.html { redirect_to admin_transactions_path }
      format.js   { render :action => 'update_transaction' }
    end
  end
end
