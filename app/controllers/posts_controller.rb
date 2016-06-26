class PostsController < ApplicationController
  #Showing all posts by using the Active Record .all function
  def home
    @posts = Post.all.order ("vote_count desc") # select * from posts
    # Post.count #select count(*) from posts
  end

  #Creating a new post, which will be altered by a form_for in the corresponding view
  def new
      @post = Post.new
  end

  #Interacting with the database via .save method in active record
  #Needs to first grab the form's info (coming from views) and store it to a new post
  #if validated, takes to home, otherwise, stay hereuntil validated
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    if params[:post][:username].present?
      @post.username = params[:post][:username]
    else
      @post.username = "anonymous"
    end
    if @post.save
      redirect_to show_path(id: @post.id)
    else
      render :new
    end
  end

  #use the .find_by method on Post class to interact with the database and SELECT * WHEN id = params id
  def show
    @post = Post.find_by id: params[:id]
    @comment = Comment.new
  end

  #use the .find_by method to find the post where the vote request is up, then use .save to update database
  def voteup
    @post = Post.find_by(id: params[:id])
    # @post.update(vote_count: @post.vote_count + 1)
    @post.upvote
    redirect_to posts_path
  end

  def voteup_inshow
    @post = Post.find_by(id: params[:id])
    @post.upvote
    redirect_to show_path
  end

  #use the .find_by method to find the post where the vote request is up, then use .save to update database
  def votedown
    @post = Post.find_by(id: params[:id])
    # @post.update(vote_count: @post.vote_count + 1)
    @post.downvote
    redirect_to posts_path
  end

  def votedown_inshow
    @post = Post.find_by(id: params[:id])
    @post.downvote
    redirect_to show_path
  end

  def create_comment
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.post_id = params[:id]
    if params[:comment][:username].present?
      @comment.username = params[:comment][:username]
    else
      @comment.username = "anonymous"
    end

    @comment.save
    redirect_to show_path(id: @comment.post_id)

  end

end
