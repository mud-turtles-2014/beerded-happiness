class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:signin_error] = @user.errors.full_messages
      redirect_to "/login"
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :password)
  end
end
