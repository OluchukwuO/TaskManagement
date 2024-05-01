class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :assigned_to, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
