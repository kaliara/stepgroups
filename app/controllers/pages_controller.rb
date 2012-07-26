class PagesController < ApplicationController
  # caches_page :show, :home
  
  def home
    @announcement = Announcement.last
    @meetings = Meeting.upcoming
    
    respond_to do |format|
      format.html # home.html.erb
      format.json { render :json => @page }
    end
  end
  
  def intergroup
    @past_meeting = IntergroupSession.past_meeting
    
    respond_to do |format|
      format.html # intergroup.html.erb
      format.json { render :json => @page }
    end
  end
  
  
  # GET /pages/1
  # GET /pages/1.json
  def show
    # @body_class = "pages #{params[:slug].parameterize}"
    
    if File.exists?(Rails.root.join("app", "views", "pages", "#{params[:slug]}.html.erb"))
      render :action => params[:slug]
    else
      @page = Page.find_by_slug(params[:slug])
      if @page.nil?
        redirect_to root_path
      else
        respond_to do |format|
          format.html # show.html.erb
          format.json { render :json => @page }
        end
      end
    end
    
  end
  
end