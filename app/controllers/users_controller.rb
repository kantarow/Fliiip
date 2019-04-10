class UsersController < ApplicationController
  helper_method :find_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to @user
    else
      render 'new'
      flash[:danger] = "Failed to create the user"
    end
  end

  def show
  end

  def edit
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
      @user = User.find_by_id_name(params[:id])
    end

    def user_params
      params.require(:user).permit(:id_name, :name, :email, :bio, :password, :password_confirmation)
    end
end
