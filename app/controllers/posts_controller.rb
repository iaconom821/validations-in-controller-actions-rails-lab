class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update

    
    newbie = Post.new(post_params)

    if !newbie.valid?
      render :edit
    else
      @post.update(post_params)

      redirect_to post_path(@post)
    end
  end


  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
