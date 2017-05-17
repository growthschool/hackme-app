class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:nickname)
  end

end
