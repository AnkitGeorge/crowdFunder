class AddAssociationsToComment < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :project #did not work as expected
    add_column :comments, :user_id, :integer
  end
end
