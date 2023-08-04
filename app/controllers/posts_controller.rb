class PostsController < ApplicationController
  def index
    posts = Post.order('created_at DESC')
    render json: {status_code: 'SUCCESS', message:'Posts Loaded', data:posts},status: :ok
  end

  def show
    post = Post.find(params[:id])
    render json: {status: 'SUCCESS', message:'Post Found', data:post},status: :ok
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: {status: 'SUCCESS', message:'Post Created', data:post},status: :ok
    else
      render json: {status: 'ERROR', message:'Post Not Created', data:post.errors},status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: {status: 'SUCCESS', message:'Post Deleted', data:post},status: :ok
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: {status: 'SUCCESS', message:'Post Updated', data:post},status: :ok
    else
      render json: {status: 'ERROR', message:'Post Not Updated', data:post.errors},status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :content, :user_id)
  end
end
