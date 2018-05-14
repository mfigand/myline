class UsersController < ApplicationController
  before_filter :validate_user, :only => :show
  before_action :authenticate_user!, except: :update

  def index
    @allUser = User.all
  end

  def new
    @user = User.new user_params
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:notice] = "User created succesfully"
      render status: 200, json: @user.to_json
    else
      begin
        raise ArgumentError, @user.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT User not created because #{ex.message}"
      end
      render json: @user.errors.messages
    end
  end

  def show
    children = current_user.children.count

    case children
    when 0
      redirect_to user_path(current_user)
    when 1
      redirect_to user_child_path( params[:id], @child.id )
    when 2..Float::INFINITY
      redirect_to user_children_path( current_user )
    else
      if current_user.try(:stories).any?
        redirect_to user_children_path( current_user )
      else
        redirect_to user_path(current_user)
      end
    end

     # if current_user.children.count > 0
     #   redirect_to user_child_path(params[:id],@user.children.first.id)
     # #if is Teller for children show first
     # elsif is_teller.any?
     #   @child = is_teller.first.child
     #   redirect_to user_child_path(params[:id],@child.id)
     # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes user_params
      render status: 200, json: @user.to_json
    else
      render "edit"
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def profile
   @user = current_user
   render 'users/profile'
  end

  private

 def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
 end

 def validate_user
    redirect_to home_path unless current_user.id.to_s == params[:id]
 end

end
