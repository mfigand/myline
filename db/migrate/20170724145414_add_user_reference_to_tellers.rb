class AddUserReferenceToTellers < ActiveRecord::Migration
  def change
    add_reference :tellers, :user, index: true, foreign_key: true
  end
end
