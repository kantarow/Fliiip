class ApplicationController < ActionController::Base
  helper_method(
    :login,
    :current_user,
    :logout,
    :logged_in?
  )
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user = session[:user_id] && User.find_by_id_name(session[:user_id])
    puts "-----"
    p @current_user
  end

  def logout
    session.delete(:user_id)
    #redirect_to root_url
  end

  def logged_in?
    !current_user.nil?
  end
end
