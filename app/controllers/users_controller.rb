class UsersController < ApplicationController
  def show
    if user_signed_in?
      user = User.find_by(id: current_user.id)
      @mastname = 'ようこそ'
      @mastname += @user.try(:nickname)  || '名無し'
      @mastname += 'さん'
    end
  end
end
