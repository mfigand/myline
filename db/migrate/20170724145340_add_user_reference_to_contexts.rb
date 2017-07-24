class AddUserReferenceToContexts < ActiveRecord::Migration
  def change
    add_reference :contexts, :user, index: true, foreign_key: true
  end
end
