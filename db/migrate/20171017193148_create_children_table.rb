class CreateChildrenTable < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.date :birth_day
    end
  end
end
