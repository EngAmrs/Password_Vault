class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  

  def new
    if current_user
      redirect_to '/services/new', notice: "Logged in successfully!"
    else
      puts "not login"
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/services', notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
