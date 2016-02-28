class UsersController < ApplicationController
  # before_action :ensure_logged_in, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to projects_url
      flash[:notice] = 'Account created. Woo!'

    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
