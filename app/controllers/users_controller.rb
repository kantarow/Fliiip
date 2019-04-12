class UsersController < ApplicationController
  helper_method :find_user

  def show
  end

  def edit
    @user = find_user
  end

  def update
    if find_user.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to find_user
    else
      render 'edit'
      flash[:danger] = "Failed to update the user"
    end
  end

  def destory
    find_user.delete
  end

  private
    
    def find_user
      return @user if defined? @user
      @user = User.find_by_uid(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :bio)
    end
end
