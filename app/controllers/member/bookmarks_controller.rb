class Member::BookmarksController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]
  before_action :ensure_correct_member, only: [:create, :destroy]
  
  def index
    @genres = Genre.where(is_active: true)
    @bookmarks = Bookmark.where(member_id: params[:member_id]).page(params[:page]).per(9)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    bookmark = @movie.bookmarks.new(member_id: current_member.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    bookmark = @movie.bookmarks.find_by(member_id: current_member.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
