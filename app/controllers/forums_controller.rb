class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.visible
    @forum_posts = ForumPost.recent

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @forum = Forum.visible.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum }
    end
  end
end
