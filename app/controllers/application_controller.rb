class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
include SessionsHelper

private

def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in_user
    unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
end
end
