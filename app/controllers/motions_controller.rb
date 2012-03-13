class MotionsController < ApplicationController
  # GET /motions
  # GET /motions.json
  def index
    @motions = Motion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motions }
    end
  end

  # GET /motions/1
  # GET /motions/1.json
  def show
    @motion = Motion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motion }
    end
  end
end
