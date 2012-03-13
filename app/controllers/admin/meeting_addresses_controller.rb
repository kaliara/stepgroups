class Admin::MeetingAddressesController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meeting_addresses = District.all.collect{|d| d.meeting_addresses}.flatten

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting_address = MeetingAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting_address }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    redirect_to(new_admin_district_path, notice: 'Please create a District before adding a new Address') and return if District.all.empty?
    
    @meeting_address = MeetingAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting_address }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting_address = MeetingAddress.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting_address = MeetingAddress.new(params[:meeting_address])

    respond_to do |format|
      if @meeting_address.save
        format.html { redirect_to admin_meeting_address_path(@meeting_address), notice: 'Address was successfully created.' }
        format.json { render json: @meeting_address, status: :created, location: @meeting_address }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting_address = MeetingAddress.find(params[:id])

    respond_to do |format|
      if @meeting_address.update_attributes(params[:meeting_address])
        format.html { redirect_to admin_meeting_address_path(@meeting_address), notice: 'MeetingAddress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting_address = MeetingAddress.find(params[:id])
    @meeting_address.destroy

    respond_to do |format|
      format.html { redirect_to admin_meeting_addresss_path }
      format.json { head :no_content }
    end
  end
end
