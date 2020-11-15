class Member::MembersController < ApplicationController
  def index
    @members = Member.all
    @member = current_member
    
  end

  def show
    @genres = Genre.where(is_active: true)
    @member = Member.find(params[:id])
    # @reviews = @member.reviews
    # @bookmarks = @member.bookmarks
    
  end

  def edit
  end

  def update
  end

  def destroy_page
  end

  def leave
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :introduction, :profile_image, :sex, :birthday, :best1, :best2, :best3)
  end
end
