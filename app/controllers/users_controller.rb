class UsersController < ApplicationController

  before_action :authenticate_user!, except: :update

  def profile
   @user = current_user
   render 'users/profile'
  end

  def show
     @allRewards = Reward.all
     @coupons = current_user.coupons
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes user_params
      redirect_to action: :profile
    else
      render "edit"
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

 def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

end
