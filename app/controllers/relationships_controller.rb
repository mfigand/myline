class RelationshipController < ApplicationController
  # before_action :is_authorized?, only: [:show]
  # before_action :authenticate_user!, :except => [:update]

  def index
    @relationships = Relationship.all
  end

  def create
    
  end

  def edit
    @relationship = Relationship.find(params[:id])
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to root_path
  end


   private

 def relationship_params
  params.require(:relationship).permit(:user_id, :child_id, :relationship)
 end

 # def is_authorized?
 #   @child = current_user.children.where(id: params[:id]).first || current_user.children.where(id: params[:child_id]).first
 #   @user = current_user
 #   # @tellers = @child.try(:tellers)
 #   if @child == nil || @user == nil
 #     redirect_to user_path(current_user.id)
 #   end
 # end

end
