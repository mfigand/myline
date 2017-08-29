class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.json :tag
      t.date :date
      t.string :image
      t.integer :teller_id
      t.belongs_to :user, index: true
    end
  end
end
