class CommentsController < ApplicationController

  def new
      @comment = Comment.new
  end

  #Interacting with the database via .save method in active record
  #Needs to first grab the form's info (coming from views) and store it to a new post
  #if validated, takes to home, otherwise, stay hereuntil validated
  def create
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.username = params[:comment][:username]
    @comment.post_id = params[:comment][:post_id]
    if @comment.save
      redirect_to show_path
    else
      render :new
    end
  end

end
