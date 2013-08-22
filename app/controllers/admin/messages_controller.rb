class Admin::MessagesController < ApplicationController
  http_basic_authenticate_with :name => SITE_CONFIG['username'], :password => SITE_CONFIG['password'] if SITE_CONFIG['perform_authentication']
  layout 'admin'

  # GET /messages
  # GET /messages.json
  def index
    count = params[:show_all] ? nil : 10
    @website_messages = Message.where("kind = ?", 'website').order("created_at DESC").limit(count)
    @voicemail_messages = Message.where("kind = ?", 'voicemail').order("created_at DESC").limit(count)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
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

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to admin_message_path(@message), notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to admin_message_path(@message), notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def status
    @message = Message.find(params[:id])
    @message.responded_to = true if params[:status] == "responded"
    @message.save
    
    redirect_to admin_messages_path
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  # def destroy
  #   @message = Message.find(params[:id])
  #   @message.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to admin_messages_path }
  #     format.json { head :no_content }
  #   end
  # end
end
