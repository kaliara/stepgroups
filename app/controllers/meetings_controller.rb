class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @address_id = params[:address_id].to_i
    
    if @address_id > 0
      @meeting_addresses = [MeetingAddress.find(params[:address_id])]
      @districts = [@meeting_addresses.first.district]
    else
      @districts = params[:district].blank? ? District.all : [District.find_by_slug(params[:district])]
      @meeting_addresses = MeetingAddress.where("district_id in (?)", @districts.collect{|d| d.id})
    end
    
    @map_addresses = @meeting_addresses.collect{|ma| ["'#{ma.building} (meetings: #{ma.meetings.count})'", ma.lat, ma.lng, (ma.meetings.size > 1 ? meetings_by_address_url(ma.id) : meeting_url(ma.meetings.first.id))]}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Meeting.all }
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
end