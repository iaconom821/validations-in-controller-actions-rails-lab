class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    
    if !@author.valid?
      render :new 
    else
      @author.save
      
      redirect_to author_path(@author)
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
