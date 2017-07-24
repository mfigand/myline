class CreateTellers < ActiveRecord::Migration
  def change
    create_table :tellers do |t|
      t.string :name
      t.string :title
      t.string :avatar
    end
  end
end
