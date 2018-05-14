class AddColumnsToUsers < ActiveRecord::Migration

  def change
    add_column :users, :name, :string
    add_column :users, :type, :string
    add_column :users, :kinship, :string
    add_column :users, :birthday, :date
    add_column :users, :parent_id, :integer
    # add_column :users, :child_id, :integer
    add_column :users, :teller_id, :integer
    add_column :users, :user_id, :integer
  end

end
