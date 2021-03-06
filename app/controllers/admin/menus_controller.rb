class Admin::MenusController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']
  layout 'admin'

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.order('location asc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new
    @districts = District.all.collect{|d| ["Meetings - #{d.name}", meetings_by_district_path(:district => d.slug)]}
    @pages = Page.published.collect{|p| [p.name, view_page_path(p.slug)]} 
    @paths = [["Homepage", root_path],
              ["Contact Us", contact_path],
              ["Announcements", announcements_path],
              ["Dicussion Forums", forums_path],
              ["Meeting List", meetings_path]] + 
             @districts +
             [["Intergroup", intergroup_path],
              ["Intergroup Meetings", intergroup_sessions_path],
              ["Documents - All", documents_path],
              ["Documents - Minutes", typed_documents_path(:type => 'minutes')],
              ["Documents - Normal", typed_documents_path(:type => 'normal')]] +
             @pages
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @districts = District.all.collect{|d| ["Meetings - #{d.name}", meetings_by_district_path(:district => d.slug)]}
    @pages = Page.published.collect{|p| [p.name, view_page_path(p.slug)]} 
    @paths = [["Homepage", root_path],
              ["Contact Us", contact_path],
              ["Announcements", announcements_path],
              ["Dicussion Forums", forums_path],
              ["Meeting List", meetings_path]] + 
             @districts +
             [["Intergroup", intergroup_path],
              ["Intergroup Meetings", intergroup_sessions_path],
              ["Documents - All", documents_path],
              ["Documents - Minutes", typed_documents_path(:type => 'minutes')],
              ["Documents - Normal", typed_documents_path(:type => 'normal')]] +
             @pages
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menu_path(@menu), notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to admin_menu_path(@menu), notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to admin_menus_path }
      format.json { head :no_content }
    end
  end
end
