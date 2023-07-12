class UsersController < ApplicationController
  before_action :redirect_if_authenticated
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/registration_success'
    else
      flash.now[:alert] = "Invalid email or password format."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
