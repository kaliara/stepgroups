class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meeting_addresses = District.all.collect{|d| d.meeting_addresses}

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