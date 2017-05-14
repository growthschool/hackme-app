class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    params[:user].permit!

    if @user.update(params[:user])
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

end
