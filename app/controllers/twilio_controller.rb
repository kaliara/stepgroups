class TwilioController < ApplicationController
  # caches_page :show, :home
  
  def start
    @digit = params[:Digits]
    
    case @digit
    when "1"
      redirect_to :action => :district_list
    when "2"
      redirect_to :action => :info, :key => "codependency"
    when "3"
      redirect_to :action => :info, :key => "coda"
    when "4"
      redirect_to :action => :voicemail
    else
      render :action => :start
    end
  end
  
  def district_list
    @digit = params[:Digits]
    @districts = District.all
    
    if @digit == "*"
      redirect_to :action => :start
    elsif @digit.to_i > 0
      @district_id = @districts[@digit.to_i - 1].id
      @meeting_addresses = MeetingAddress.where("district_id in (?)", @district_id)
      @meetings = @meeting_addresses.collect{|ma| ma.meetings}.flatten
      redirect_to :action => :meeting_list, :district_id => @district_id
    else
      render :action => :district_list
    end
  end
  
  def meeting_list
    @digit = params[:Digits]
    @district = District.find(params[:district_id])
    
    if @digit == "*"
      redirect_to :action => :district_list
    elsif @digit.to_i > 0
      if @district
        @meeting_addresses = MeetingAddress.where("district_id in (?)", @district.id)
        @meetings = @meeting_addresses.collect{|ma| ma.meetings}.flatten
        redirect_to :action => :meeting_detail, :district_id => @district.id, :meeting_id => @meetings[@digit.to_i - 1].id
      else
        redirect_to :action => :district_list
      end
    else
      @meeting_addresses = MeetingAddress.where("district_id in (?)", @district.id)
      @meetings = @meeting_addresses.collect{|ma| ma.meetings}.flatten
      render :action => :meeting_list
    end
  end
  
  def meeting_detail
    @digit = params[:Digits]
    if @digit == "*"
      redirect_to :action => :meeting_list, :district_id => params[:district_id]
    elsif
      @meeting = Meeting.find(params[:meeting_id])
      render :action => :meeting_detail
    end
  end
  
  def info
    @digit = params[:Digits]
    
    if @digit == "*"
      redirect_to :action => :start
    elsif !params[:key].blank?
      @key = params[:key]
      render :action => :info
    end
  end
  
  def voicemail
  end
  
end