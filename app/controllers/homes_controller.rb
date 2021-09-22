class HomesController < ApplicationController

  def top
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "太朗"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "タロウ"
      user.first_name_kana = "タロウ"
      user.company = "◯◯株式会社"
    end
    sign_in user
    redirect_to events_path
  end

end
