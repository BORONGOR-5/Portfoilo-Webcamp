class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
  end

  def index
    @movies = Movie.all.page(params[:page]).per(8)
  end

  def new
    @movie = Movie.new
    @genre = Genre.where(is_active: true)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie)
    else
      @genre = Genre.where(is_active: true)
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @genre = Genre.where(is_active: true)
  end

  def update
    @movie = Movie.find(params[:id])
    @genre = Genre.where(is_active: true)
    if @movie.update(movie_params)
      redirect_to admin_movie_path
    else
      render :edit
    end
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :image, :introduction, :genre_id)
  end 
end
