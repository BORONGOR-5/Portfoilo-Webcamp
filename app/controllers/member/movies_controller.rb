class Member::MoviesController < ApplicationController
  def top
    @rank_movies = Movie.find(
      Review.group(:movie_id).order('count(movie_id) DESC').limit(3).pluck(:movie_id)
    )
    @genres = Genre.where(is_active: true)
    @movies = Movie.all.page(params[:page]).per(3)
  end

  def index
    @genres = Genre.where(is_active: true)
    @movies = Movie.all.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.where(is_active: true)
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end
end
