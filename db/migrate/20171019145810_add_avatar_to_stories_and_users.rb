class AddAvatarToStoriesAndUsers < ActiveRecord::Migration
  def up
    add_attachment :stories, :avatar
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :stories, :avatar
    remove_attachment :users, :avatar
  end
end
