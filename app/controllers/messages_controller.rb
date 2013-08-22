class MessagesController < ApplicationController
  protect_from_forgery :except => :create_voicemail
  
  # GET /messages/temp
  # GET /messages/temp.json
  def show
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /messages/voicemail
  def create_voicemail
    if params[:RecordingUrl] and params[:From]
      @message = Message.new({
        kind: 'voicemail',
        contact_id: params[:CallSid],
        contact_details: params[:From],
        contact_name: [params[:FromCity], params[:FromState]].join(" "),
        audio_url: params[:RecordingUrl], 
        audio_duration: params[:RecordingDuration]
      })
      @message.save(:validate => false)
      render text: "success"
    end
  end
  
  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.contact_name = 'Anonymous' if @message.contact_name.blank?
    @message.contact_details = 'Anonymous' if @message.contact_details.blank?
    @message.subject = "Details" if @message.subject.blank?

    respond_to do |format|
      if @message.save
        format.html { render action: "show" }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
