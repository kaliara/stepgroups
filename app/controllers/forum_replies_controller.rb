class ForumRepliesController < ApplicationController
  # POST /forum_replies
  # POST /forum_replies.json
  def create
    @forum_reply = ForumReply.new(params[:forum_reply])

    respond_to do |format|
      if @forum_reply.save
        format.html { redirect_to @forum_reply.forum_post, notice: 'Forum reply was successfully created.' }
        format.json { render json: @forum_reply, status: :created, location: @forum_reply }
      else
        format.html { render action: "new" }
        format.json { render json: @forum_reply.errors, status: :unprocessable_entity }
      end
    end
  end
end
