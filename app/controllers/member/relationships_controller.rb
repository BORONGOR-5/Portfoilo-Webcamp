class Member::RelationshipsController < ApplicationController
  before_action :authenticate_member!
  def create
    current_member.follow(params[:member_id])
    redirect_to request.referer
  end
  
  def destroy
    current_member.unfollow(params[:id])
    redirect_to request.referer
  end
  
  def followings
    @genres = Genre.where(is_active: true)
    member = Member.find(params[:member_id])
    @members = member.followings
  end

  def followers
    @genres = Genre.where(is_active: true)
    member = Member.find(params[:member_id])
    @members = member.followers
  end
end
