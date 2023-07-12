module Authentication   
    extend ActiveSupport::Concern
  
    included do
      before_action :current_user
      helper_method :current_user
      helper_method :user_signed_in?
    end
  
    def login(user)
      reset_session
      session[:current_user_id] = user.id
    end
  
  
    def redirect_if_authenticated
      redirect_to '/services', alert: "You are already logged in." if user_signed_in?
    end

    def redirect_if_not_authenticated
        redirect_to '/', alert: "You are not logged in." if !user_signed_in?
    end
  
    private
  
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
  
    def user_signed_in?
      if current_user
        return true
      end
        return false
    end
  
  end