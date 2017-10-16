class CreateTellers < ActiveRecord::Migration
  def change
    create_table :tellers do |t|
      t.integer :user_teller_id
      t.string :title
    end
  end
end
