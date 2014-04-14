class PostsController < ApplicationController

  before_filter :authorize, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      current_user.posts << @post
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
       respond_to do |format|
        format.html { redirect_to users_path(current_user) }
        format.js {render 'new'}
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:name, :comment)
    end
end
