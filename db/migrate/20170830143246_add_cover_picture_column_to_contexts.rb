class AddCoverPictureColumnToContexts < ActiveRecord::Migration
  def up
    add_attachment :contexts, :coverPicture
  end

  def down
    remove_attachment :contexts, :coverPicture
  end
end
