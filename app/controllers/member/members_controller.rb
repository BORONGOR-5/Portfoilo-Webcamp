class Member::MembersController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)
    @members = Member.where(is_deleted: false).page(params[:page]).per(10)
    @member = current_member
  end

  def show
    @genres = Genre.where(is_active: true)
    @member = Member.find(params[:id])
    @reviews = @member.reviews.page(params[:page]).per(10)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def destroy_page
    @member = Member.find(params[:id])
  end

  def leave
    @member = current_member
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @member.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "退会しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :introduction, :profile_image, :sex, :birthday, :best1, :best2, :best3)
  end
end
