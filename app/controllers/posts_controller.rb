class PostsController < ApplicationController


  def home

    @posts = Post.all # select * from posts
    # Post.count #select count(*) from posts

  end

  def new
      @post = Post.new
  end

  def create

    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

end
