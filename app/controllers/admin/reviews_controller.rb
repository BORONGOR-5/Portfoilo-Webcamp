class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all.page(params[:page]).per(10)
  end
  
  def index_member
    @member = Member.find(params[:id])
    @reviews = @member.reviews.page(params[:page]).per(10)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to admin_reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :impression, :star)
  end 
end
