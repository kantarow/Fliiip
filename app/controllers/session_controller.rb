class SessionController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if user.nil?
      flash[:danger] = "Failed to authenticate"
    else
      login(user)
      flash[:success] = "User is authenticated"
      redirect_to user
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
