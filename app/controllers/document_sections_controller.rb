class DocumentSectionsController < ApplicationController
  # GET /document_sections
  # GET /document_sections.json
  def index
    @document_sections = DocumentSection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_sections }
    end
  end

  # GET /document_sections/1
  # GET /document_sections/1.json
  def show
    @document_section = DocumentSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_section }
    end
  end

  # GET /document_sections/new
  # GET /document_sections/new.json
  def new
    @document_section = DocumentSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_section }
    end
  end

  # GET /document_sections/1/edit
  def edit
    @document_section = DocumentSection.find(params[:id])
  end

  # POST /document_sections
  # POST /document_sections.json
  def create
    @document_section = DocumentSection.new(params[:document_section])

    respond_to do |format|
      if @document_section.save
        format.html { redirect_to @document_section, notice: 'Document section was successfully created.' }
        format.json { render json: @document_section, status: :created, location: @document_section }
      else
        format.html { render action: "new" }
        format.json { render json: @document_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_sections/1
  # PUT /document_sections/1.json
  def update
    @document_section = DocumentSection.find(params[:id])

    respond_to do |format|
      if @document_section.update_attributes(params[:document_section])
        format.html { redirect_to @document_section, notice: 'Document section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_sections/1
  # DELETE /document_sections/1.json
  def destroy
    @document_section = DocumentSection.find(params[:id])
    @document_section.destroy

    respond_to do |format|
      format.html { redirect_to document_sections_url }
      format.json { head :no_content }
    end
  end
end
