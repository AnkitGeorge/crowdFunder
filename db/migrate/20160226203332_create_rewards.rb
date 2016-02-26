class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.integer :min_requirement
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
