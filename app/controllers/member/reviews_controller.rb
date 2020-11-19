class Member::ReviewsController < ApplicationController
  def member_index
    @member = Member.find(params[:id])
    @reviews = @member.reviews
  end

  def show
    @genres = Genre.where(is_active: true)
    @review = Review.find(params[:id])
    @movie = Movie.find(@review.movie.id)
    @member = Member.find(@review.member.id)
    
  end

  def new
    @genres = Genre.where(is_active: true)
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.movie_id = params[:movie_id].to_i
    @review.save
    redirect_to movie_path(params[:movie_id].to_i)
  end

  def edit
    @genres = Genre.where(is_active: true)
    @review = Review.find(params[:id])
    @movie = Movie.find(@review.movie.id)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :impression, :star)
  end 
end
