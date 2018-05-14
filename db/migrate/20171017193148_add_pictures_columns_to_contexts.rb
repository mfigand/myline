class AddPicturesColumnsToContexts < ActiveRecord::Migration
  def up
    add_attachment :contexts, :coverPicture
    add_attachment :contexts, :aboutPicture
    add_attachment :contexts, :parallaxPicture
  end

  def down
    remove_attachment :contexts, :coverPicture
    remove_attachment :contexts, :aboutPicture
    remove_attachment :contexts, :parallaxPicture
  end
end
