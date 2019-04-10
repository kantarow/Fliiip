class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email_or_id]) ||
           User.find_by_id_name(params[:email_or_id])
    if user && user.authenticate(params[:password])
      flash[:success] = "Login as @#{user.id_name}"
      login(user)
      redirect_to user
    else
      flash[:warn] = "Failed to login"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
