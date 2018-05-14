class CreateTellers < ActiveRecord::Migration
  def change
    create_table :tellers do |t|

      t.timestamps null: false
    end
  end
end
