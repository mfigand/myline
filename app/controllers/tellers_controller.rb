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
    child = Child.find(params[:child_id])
    if tellerToAdd.present?
      # send notification to new teller
      Teller.create(user_teller_id: tellerToAdd.id, title: params[:title], user_id: current_user.id, child_id: child.id, story_id:nil)
      NotificationMailer.notification_email(tellerToAdd,current_user,child).deliver
    else
      # send invitation to create user profile
      NotificationMailer.notification_email(params[:email],current_user,child).deliver
    end
    # binding.pry
    # redirect_to user_child_path(current_user.id,child.id)
    # redirect_to "/users/"+current_user.id.to_s+"/children/"+params[:child_id]+"#tellers"
    # redirect_to "/"

  end


  private

 def teller_params
  params.require(:teller).permit(:name, :date, :image, :teller_id)
 end

end
