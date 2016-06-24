class CommentsController < ApplicationController

  def new
      @comment = Comment.new
      @comment.post_id = params[:post_id]
  end

  #Interacting with the database via .save method in active record
  #Needs to first grab the form's info (coming from views) and store it to a new post
  #if validated, takes to home, otherwise, stay hereuntil validated
  def create

    @post = Post.find_by(id: params[:post_id])

    if @post.nil?
        render :new
    end

    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.username = params[:comment][:username]
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to show_path(id: @comment.post_id)
    else
      render :new
    end
  end

end
