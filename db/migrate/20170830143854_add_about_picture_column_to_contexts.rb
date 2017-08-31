class AddAboutPictureColumnToContexts < ActiveRecord::Migration
  def up
    add_attachment :contexts, :aboutPicture
  end

  def down
    remove_attachment :contexts, :aboutPicture
  end
end
