class AddAvatarColumnsToStories < ActiveRecord::Migration
   def up
    add_attachment :stories, :avatar
  end

  def down
    remove_attachment :stories, :avatar
  end
end
