class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :tag
      t.date :date
      t.string :image
      t.integer :teller_id
    end
  end
end
