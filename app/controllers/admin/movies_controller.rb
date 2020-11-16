class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
  end

  def index
    @movies = Movie.all.page(params[:page]).per(8)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :image, :introduction, :genre_id)
  end 
end
