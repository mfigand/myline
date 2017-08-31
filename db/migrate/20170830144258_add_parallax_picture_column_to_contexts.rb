class AddParallaxPictureColumnToContexts < ActiveRecord::Migration
  def up
    add_attachment :contexts, :parallaxPicture
  end

  def down
    remove_attachment :contexts, :parallaxPicture
  end
end
