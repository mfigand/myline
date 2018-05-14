class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.json :tag
      t.date :date
      t.string :image
      # t.integer :parent_id
      t.integer :teller_id
      t.integer :user_id
      # t.integer :child_id

      t.timestamps null: false
    end

    # add_index :stories, [:parent_id, :teller_id, :child_id]
    add_index :stories, [:user_id, :teller_id]

  end
end
