class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
                
                def current_user
                  @current_user ||= User.find(session[:user_id]) if session[:user_id]
                end

                def authenticate
                  redirect_to(new_session_path) unless signed_in?
                end

                def signed_in?
                  !!current_user
                end

                helper_method :current_user, :signed_in?
end
