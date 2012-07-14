class Admin::MotionsController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']

  # GET /motions
  # GET /motions.json
  def index
    @motions = Motion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motions }
    end
  end

  # GET /motions/1
  # GET /motions/1.json
  def show
    @motion = Motion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motion }
    end
  end

  # GET /motions/new
  # GET /motions/new.json
  def new
    @motion = Motion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motion }
      format.js   { render action: "new" }
    end
  end

  # GET /motions/1/edit
  def edit
    @motion = Motion.find(params[:id])
  end

  # POST /motions
  # POST /motions.json
  def create
    @motion = Motion.new(params[:motion])

    respond_to do |format|
      if @motion.save
        format.html { redirect_to admin_motion_path(@motion), notice: 'Motion was successfully created.' }
        format.json { render json: @motion, status: :created, location: @motion }
        format.js   { render action: "create" }
      else
        format.html { render action: "new" }
        format.json { render json: @motion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /motions/1
  # PUT /motions/1.json
  def update
    @motion = Motion.find(params[:id])

    respond_to do |format|
      if @motion.update_attributes(params[:motion])
        format.html { redirect_to admin_motion_path(@motion), notice: 'Motion was successfully updated.' }
        format.json { head :no_content }
        format.js   { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motions/1
  # DELETE /motions/1.json
  def destroy
    @motion = Motion.find(params[:id])
    @motion.destroy

    respond_to do |format|
      format.html { redirect_to admin_motions_path }
      format.json { head :no_content }
      format.js   { render action: "destroy" }
    end
  end
end
