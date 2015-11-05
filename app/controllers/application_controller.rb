class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    #事前过滤器,保证用户已经登录才能编辑
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "你得先登录才能进行下一步操作"
        redirect_to login_url
      end
    end
end
