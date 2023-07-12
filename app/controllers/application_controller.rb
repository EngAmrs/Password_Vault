class ApplicationController < ActionController::Base
    include Authentication
    # def current_user
    #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    # end
  
    # def action
    #   if current_user
    #     puts current_user
    #   else
    #     puts "not login"
    #   end
    # end
  end
  