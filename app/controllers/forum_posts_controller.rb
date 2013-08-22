class ForumPostsController < ApplicationController
  # GET /forum_posts
  # GET /forum_posts.json
  def index
    @forum_posts = ForumPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forum_posts }
    end
  end

  # GET /forum_posts/1
  # GET /forum_posts/1.json
  def show
    @forum_post = ForumPost.find(params[:id])
    @forum_reply = ForumReply.new(:forum_post_id => @forum_post.id, :author => "")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum_post }
    end
    
    @forum_post.update_column(:views, @forum_post.views + 1)
    # @forum_post.save
  end

  # GET /forum_posts/new
  # GET /forum_posts/new.json
  def new
    @forum_post = ForumPost.new(:author => "")
    @forum_post.forum_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum_post }
    end
  end

  # GET /forum_posts/1/edit
  def edit
    @forum_post = ForumPost.find(params[:id])
  end

  # POST /forum_posts
  # POST /forum_posts.json
  def create
    @forum_post = ForumPost.new(params[:forum_post])

    respond_to do |format|
      if @forum_post.save
        format.html { redirect_to @forum_post, notice: 'Forum post was successfully created.' }
        format.json { render json: @forum_post, status: :created, location: @forum_post }
      else
        format.html { render action: "new" }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forum_posts/1
  # PUT /forum_posts/1.json
  def update
    @forum_post = ForumPost.find(params[:id])

    respond_to do |format|
      if @forum_post.update_attributes(params[:forum_post])
        format.html { redirect_to @forum_post, notice: 'Forum post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_posts/1
  # DELETE /forum_posts/1.json
  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_post.destroy

    respond_to do |format|
      format.html { redirect_to forum_posts_url }
      format.json { head :no_content }
    end
  end
end
