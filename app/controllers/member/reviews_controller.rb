class Member::ReviewsController < ApplicationController
  def member_index
    @member = Member.find(params[:id])
    @reviews = @member.reviews
  end

  def show
    @genres = Genre.where(is_active: true)
    @movie = Movie.find(params[:id])
    @member = Member.find(params[:id])
    @review = Review.find(params[:id])
  end

  def new
    @genres = Genre.where(is_active: true)
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    # @review.member_id = current_member.id
    if @review.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @genres = Genre.where(is_active: true)
    @movie = Movie.find(params[:id])
    @review = Review.find(params[:id])
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
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :impression, :star)
  end 
end
