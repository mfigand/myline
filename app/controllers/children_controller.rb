class ChildrenController < ApplicationController
  before_action :is_authorized?
  before_action :authenticate_user!, except: :update

  def index
    @children = Child.all
  end

  def new
    @child = Child.new child_params
  end

  def create
    @child = Child.new child_params
    @child.user_id = params[:user_id]
    if @child.save
      flash[:notice] = "Child created succesfully"
      redirect_to user_child_path(params[:user_id],@child.id)
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
     @stories = @child.stories
     @age = @child.get_age
     @user = User.find(params[:user_id])
     @tellers = []
     @teller_titles = []
     @child.stories.map{|story|
       if @tellers.map(&:id).exclude? story.user.id
         @tellers << story.user
         @teller_titles << story.teller_title
       end
     }
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])

    if @child.update_attributes child_params
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

  def allStories
    @child = Child.find(params[:child_id])
    @allStories = @child.stories
    @allStories.map { |story|
      if story.image === nil
        story.image = story.avatar.url
        story.save
      end
    }
    render json: @allStories
  end


   private

 def child_params
  params.require(:child).permit(:name, :birth_day, :user_id)
 end

 def is_authorized?
   @child = Child.where(id:params[:id]).first
   @user = User.where(id:params[:user_id]).first
   if (@child == nil || @user == nil) && @child.try(:user) != @user
     redirect_to user_path(params[:user_id])
   end
 end

end
