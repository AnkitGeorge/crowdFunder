class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.datetime :project_end_date

      t.timestamps null: false
    end
  end
end
