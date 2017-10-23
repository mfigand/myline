class AddReferencesToTellers < ActiveRecord::Migration
  def change
    add_reference :tellers, :user, index: true, foreign_key: true
    add_reference :tellers, :child, index: true, foreign_key: true
    add_reference :tellers, :story, index: true, foreign_key: true
  end
end
