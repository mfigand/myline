class StoriesController < ApplicationController

  before_action :authenticate_user!, except: :update

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new story_params
  end

  def create
    @story = Story.new story_params
    if @story.save
      flash[:notice] = "Story created succesfully"
      render 'show'
    else
      flash[:alert] = "ALERT Story not created"
      render 'new'
    end
  end

  def show
     @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes story_params
      redirect_to action: :profile
    else
      render "edit"
    end

  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to root_path
  end


  private

 def story_params
  params.require(:story).permit(:name, :date, :image, :teller_id)
 end

end
