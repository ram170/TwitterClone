class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  attr_accessor :current_user
  protect_from_forgery with: :exception
  # @current_user = nil
  def signin(user)
    @@current_user = user
  end

  def signout
    @@current_user = nil
  end

  # def current_user
  #   @current_user
  # end
end
