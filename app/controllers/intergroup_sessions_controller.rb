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
end
