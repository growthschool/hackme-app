class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # params[:user].permit!

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname)
    #code
  end

end
