class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    if Document::TYPES.flatten.index(params[:type])
      @documents = Document.where("document_type = ?", Document::TYPES.flatten.index(params[:type]).to_i / 2)
    else
      @documents = Document.all
    end
    
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
end
