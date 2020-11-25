class Member::HomeController < ApplicationController
  def new_guest
    member = Member.find_or_create_by!(email: 'guest@example.co.jp') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in member
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
