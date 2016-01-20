class PostsController < ApplicationController
  before_action :find_posts, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Hey, Darren! Post has been added!"
    else 
      render 'new', notice: "Sorry, that didn't work, Darren."
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update post_params
      redirect_to @post, notice: "Yeah! Post has been saved!"
    else
      render 'edit', notice: "Oops, try that again..."
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
  
  def find_posts
    @post = Post.friendly.find(params[:id])
  end
  
end
