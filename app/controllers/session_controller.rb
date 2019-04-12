class SessionController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if user.nil?
      flash[:danger] = "Failed to authenticate"
      redirect_to root_url
    else
      flash[:success] = "User is authenticated"
      redirect_to user_path user
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
