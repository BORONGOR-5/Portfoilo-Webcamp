class Member::BookmarksController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]
  
  def index
    @genres = Genre.where(is_active: true)
    @bookmarks = Bookmark.where(member_id: params[:member_id]).page(params[:page]).per(9)
    @member = Member.find(params[:member_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    bookmark = @movie.bookmarks.new(member_id: current_member.id)
    if bookmark.save
      flash[:notice] = "ブックマークに追加しました。"
      redirect_to request.referer
    else
      flash[:notice] = "ブックマークに追加出来ませんでした。"
      redirect_to request.referer
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    bookmark = @movie.bookmarks.find_by(member_id: current_member.id)
    if bookmark.present?
        bookmark.destroy
        flash[:notice] = "ブックマークから削除しました。"
        redirect_to request.referer
    else
      flash[:notice] = "ブックマークから削除出来ませんでした。"
        redirect_to request.referer
    end
  end
end
