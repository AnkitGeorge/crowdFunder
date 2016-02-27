class AddAssociationsToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :pledge_id, :integer
    add_column :rewards, :project_id, :integer
  end
end
