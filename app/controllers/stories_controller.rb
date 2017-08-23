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
    @story.tag = story_params[:tag].split(' ;')
    @story.teller_id = current_user.id

    if @story.save
      flash[:notice] = "Story created succesfully"
      redirect_to user_path(story_params[:user_id])
    else
      begin
        raise ArgumentError, @story.errors.messages
      rescue Exception => ex
        puts "An error of type #{ex.class} happened, message is #{ex.message}"
        flash[:alert] = "ALERT Story not created because #{ex.message}"
      end
      redirect_to user_path(story_params[:user_id])
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

  params.require(:story).permit(:name, :date, :avatar, :tag, :user_id)
 end

end
