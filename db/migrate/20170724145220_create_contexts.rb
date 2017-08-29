class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.text :aboutDescription
      t.string :aboutPicture
      t.string :aboutVideo
      t.string :coverPicture
      t.string :parallaxPicture
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
