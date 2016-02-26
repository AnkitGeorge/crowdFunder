class AddAssociationToProject < ActiveRecord::Migration
  def change
    remove_column :projects, :user_id, :integer
    add_column :projects, :owner_id, :integer
    add_foreign_key :projects, column: :owner_id
  end
end
