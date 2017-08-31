class ContextsController < ApplicationController

  before_action :authenticate_user!, except: :update

  def index
    @contexts = Context.all
  end

  def new
    @context = Context.new context_params
  end

  def create
    @context = Context.new context_params
    if @context.save
      flash[:notice] = "Context created succesfully"
      if params[:context][:aboutDescription] != nil
       render status: 200, json: @context.to_json
      else 
        redirect_to user_path(params[:user_id])
      end
    else
      begin
        raise ArgumentError, @context.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT Context not created because #{ex.message}"
      end
      render json: @context.errors.messages
    end
  end

  def show
     @context = Context.find(params[:id])
  end

  def edit
    @context = Context.find(params[:id])
  end

  def update
    @context = Context.find(params[:id])

    if @context.update_attributes context_params
      flash[:notice] = "Context updated succesfully"
      if params[:context][:aboutDescription] != nil
       render status: 200, json: @context.to_json
      else 
        redirect_to user_path(params[:user_id])
      end
    else
      begin
        raise ArgumentError, @context.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT Context not updated because #{ex.message}"
      end
      render json: @context.errors.messages
    end

  end

  def destroy
    @context = Context.find(params[:id])
    @context.destroy
    redirect_to root_path
  end


   private

 def context_params
  params.require(:context).permit(:aboutDescription, :aboutPicture, :aboutVideo, :coverPicture, :parallaxPicture, :user_id)
 end

end
