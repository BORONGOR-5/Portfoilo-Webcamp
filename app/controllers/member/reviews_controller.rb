class Member::ReviewsController < ApplicationController
  before_action :authenticate_member!, only: [:show]
  
  def show
    @genres = Genre.where(is_active: true)
    @review = Review.find(params[:id])
    @movie = Movie.find(@review.movie.id)
    @member = Member.find(@review.member.id)
    @comment = Comment.new
    @comments = @review.comment.all
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
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to movie_path(params[:movie_id].to_i)
    else
      @genres = Genre.where(is_active: true)
      @movie = Movie.find(@review.movie.id)
      render :new
    end
  end

  def edit
    @genres = Genre.where(is_active: true)
    @review = Review.find(params[:id])
    @movie = Movie.find(@review.movie.id)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました。"
      redirect_to review_path(@review)
    else
      @genres = Genre.where(is_active: true)
      @movie = Movie.find(@review.movie.id)
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
    params.require(:review).permit(:title, :impression, :rate)
  end 
end
