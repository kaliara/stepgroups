class Admin::MeetingsController < ApplicationController
  http_basic_authenticate_with :name => AUTH_CONFIG['username'], :password => AUTH_CONFIG['password'] if AUTH_CONFIG['perform_authentication']

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    redirect_to(new_admin_district_path, notice: 'Please create a District before adding a new Meeting') and return if District.all.empty?
    
    @meeting = Meeting.new
    @meeting.meeting_address = MeetingAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])
    
    unless @meeting.meeting_address_id.to_i > 0
      @meeting.meeting_address = MeetingAddress.new(params[:meeting_address])
      @meeting.meeting_address.save
    end
      
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to admin_meeting_path(@meeting), notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to admin_meeting_path(@meeting), notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to admin_meetings_path }
      format.json { head :no_content }
    end
  end
end
