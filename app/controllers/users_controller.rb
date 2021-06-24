class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to posts_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user), notice: '更新に成功しました'
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :profile_image)
  end
end
