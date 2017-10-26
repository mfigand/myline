class TellersController < ApplicationController

  before_action :authenticate_user!, except: :update

  def index
    @tellers = Teller.all
  end

  def new
    @teller = Teller.new teller_params
  end

  def create
    @teller = Teller.new teller_params
    if @teller.save
      binding.pry
      NotificationMailer.notification_email(@user).deliver
      flash[:notice] = "Teller created succesfully"
      render status: 200, json: @teller.to_json
    else
      flash[:alert] = "ALERT Teller not created"
      render 'new'
    end
  end

  def show
     @teller = teller.find(params[:id])
  end

  def edit
    @teller = teller.find(params[:id])
  end

  def update
    @teller = teller.find(params[:id])

    if @teller.update_attributes teller_params
      render status: 200, json: @teller.to_json
    else
      render "edit"
    end

  end

  def destroy
    @teller = teller.find(params[:id])
    @teller.destroy
    redirect_to root_path
  end

  def addTeller
    tellerToAdd = User.where(email:params[:email]).first
    if tellerToAdd.present?
      binding.pry
      Teller.create(user_teller_id: tellerToAdd.id, title: params[:title], user_id: current_user.id, child_id: params[:child_id], story_id:nil)
      NotificationMailer.notification_email(@user).deliver
    else
      # send invitation
      binding.pry
      NotificationMailer.notification_email(@user).deliver
    end

    redirect_to user_child_path(current_user.id,params[:child_id])

  end


  private

 def teller_params
  params.require(:teller).permit(:name, :date, :image, :teller_id)
 end

end
