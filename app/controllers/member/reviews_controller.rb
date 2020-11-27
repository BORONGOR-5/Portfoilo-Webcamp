class Member::ReviewsController < ApplicationController
  #ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_member!, only: [:new, :edit]
  # 投稿に紐づいているユーザーと現在ログインしているユーザーが同じ場合のみ下記アクションを許可する
  before_action :ensure_correct_member, only: [:edit, :update, :destroy]
  
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
  
  def ensure_correct_member
    if current_member.id != params[:id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to root_path
    end
  end  
  
  private
  def review_params
    params.require(:review).permit(:title, :impression, :rate)
  end 
end
