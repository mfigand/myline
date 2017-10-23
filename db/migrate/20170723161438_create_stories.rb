class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.json :tag
      t.date :date
      t.string :image
      t.string :teller_title
      t.integer :teller_id
      t.belongs_to :child, index: true
      t.belongs_to :user, index: true
    end
  end
end
