class AddAssociationsToReward < ActiveRecord::Migration
  def change
    remove_column :rewards, :pledge_id, :integer
    add_column :pledges, :reward_id, :integer
  end
end
