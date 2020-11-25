class Member::CommentsController < ApplicationController
  before_action :authenticate_member!, only: [:show]
  
  def create
    review = Review.find(params[:review_id])
    @comment = review.comment.new(comment_params)
    @comment.member_id = current_member.id
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to review_path(review)
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:review_comment)
  end
end