class Member::MoviesController < ApplicationController
  def top
    rank_review_movie_ids = Review.group(:movie_id).order(review: "DESC").limit(3).pluck(:movie_id)
    @rank_movies = Movie.where(id: rank_review_movie_ids)
    # .order_as_specified(id: rank_review_movie_ids)
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
