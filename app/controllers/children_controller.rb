class ChildrenController < ApplicationController

  before_action :authenticate_user!, except: :update

  def index
    @children = Child.all
  end

  def new
    @child = Child.new context_params
  end

  def create
    @child = Child.new context_params
    if @child.save
      flash[:notice] = "Child created succesfully"
    else
      begin
        raise ArgumentError, @child.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT Child not created because #{ex.message}"
      end
      render json: @child.errors.messages
    end
  end

  def show
     @child = Child.find(params[:id])
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])

    if @child.update_attributes context_params
      flash[:notice] = "Child updated succesfully"
    else
      begin
        raise ArgumentError, @child.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT Child not updated because #{ex.message}"
      end
      render json: @child.errors.messages
    end

  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to root_path
  end


   private

 def child_params
  params.require(:child).permit(:name, :birth_date, :user_id)
 end

end
