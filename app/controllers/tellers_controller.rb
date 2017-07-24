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
      flash[:notice] = "Teller created succesfully"
      render 'show'
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
      redirect_to action: :profile
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

end
