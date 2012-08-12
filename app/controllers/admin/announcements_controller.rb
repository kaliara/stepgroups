class Admin::AnnouncementsController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']
  layout 'admin'
  
  # GET /admin/announcements
  # GET /admin/announcements.json
  def index
    @announcements = Announcement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /admin/announcements/1
  # GET /admin/announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /admin/announcements/new
  # GET /admin/announcements/new.json
  def new
    @announcement = Announcement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /admin/announcements/1/edit
  def edit
    @announcement = Announcement.find(params[:id])
  end

  # POST /admin/announcements
  # POST /admin/announcements.json
  def create
    @announcement = Announcement.new(params[:announcement])

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to admin_announcement_path(@announcement), notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/announcements/1
  # PUT /admin/announcements/1.json
  def update
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to admin_announcement_path(@announcement), notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/announcements/1
  # DELETE /admin/announcements/1.json
  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to admin_announcements_url }
      format.json { head :no_content }
    end
  end
end
