class Member::BookmarksController < ApplicationController
  before_action :authenticate_member!
  
  def index
    @bookmarks = Bookmark.where(member_id: current_member.id)
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
