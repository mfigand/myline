class TellersController < ApplicationController

  before_action :authenticate_user!, except: :update

  def index
    @tellers = Teller.all
  end

  def new
    @teller = Teller.new teller_params
  end

  def create
    @tellerToAdd = User.where(email:params[:email]).first
    @child = User.find(params[:child_id])

    case can_addTeller?
    when true
      # Add child to User's relationships
      @tellerToAdd.relationships.create(followed_id:@child.id, relationship:"teller", kinship:params[:kinship])
      # Send notification to new teller
      NotificationMailer.notification_email(@tellerToAdd,current_user,@child).deliver_now
      render json: {status: "Success", message: "Teller was added succesfully"}
    when false
      render json: {status: "Error", message: "User is already a teller for this child"}
      # User is already a teller for this child
      # flash[:alert] = "User is already a teller for this child"
    when 'not yet a user'
      # send invitation to create user profile
      NotificationMailer.notification_email(params[:email],current_user,@child).deliver_now
      render json: {status: "Error", message: "This email is doesn't match a user"}
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


  private

 def teller_params
  params.require(:teller).permit(:name, :date, :image, :teller_id)
 end

 def can_addTeller?

   if @tellerToAdd.present?
     @tellerToAdd.children.exclude?(@child) && @tellerToAdd.relationships.where(followed_id:@child.id).blank?
   else
     'not yet a user'
   end
 end

end
