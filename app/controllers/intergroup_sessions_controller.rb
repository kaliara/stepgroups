class IntergroupSessionsController < ApplicationController
  # GET /intergroup_sessions
  # GET /intergroup_sessions.json
  def index
    @intergroup_sessions = IntergroupSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intergroup_sessions }
    end
  end

  # GET /intergroup_sessions/1
  # GET /intergroup_sessions/1.json
  def show
    @intergroup_session = IntergroupSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intergroup_session }
    end
  end

  # GET /intergroup_sessions/new
  # GET /intergroup_sessions/new.json
  def new
    @intergroup_session = IntergroupSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intergroup_session }
    end
  end

  # GET /intergroup_sessions/1/edit
  def edit
    @intergroup_session = IntergroupSession.find(params[:id])
  end

  # POST /intergroup_sessions
  # POST /intergroup_sessions.json
  def create
    @intergroup_session = IntergroupSession.new(params[:intergroup_session])

    respond_to do |format|
      if @intergroup_session.save
        format.html { redirect_to @intergroup_session, notice: 'Intergroup session was successfully created.' }
        format.json { render json: @intergroup_session, status: :created, location: @intergroup_session }
      else
        format.html { render action: "new" }
        format.json { render json: @intergroup_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intergroup_sessions/1
  # PUT /intergroup_sessions/1.json
  def update
    @intergroup_session = IntergroupSession.find(params[:id])

    respond_to do |format|
      if @intergroup_session.update_attributes(params[:intergroup_session])
        format.html { redirect_to @intergroup_session, notice: 'Intergroup session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intergroup_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intergroup_sessions/1
  # DELETE /intergroup_sessions/1.json
  def destroy
    @intergroup_session = IntergroupSession.find(params[:id])
    @intergroup_session.destroy

    respond_to do |format|
      format.html { redirect_to intergroup_sessions_url }
      format.json { head :no_content }
    end
  end
end
