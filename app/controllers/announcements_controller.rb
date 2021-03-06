class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
    limit = params[:limit] || nil
    @announcements = Announcement.order('created_at desc').limit(limit)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end
  
  
  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end
end