class Admin::MembersController < ApplicationController
  def show
  end

  def edit
    @genre = Genre.where(is_active: true)
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_members_path
    else
      render 'edit'
    end
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :profile_image, :introduction, :sex, :birthday, :best1, :best2, :best3, :is_deleted)
  end 
end
