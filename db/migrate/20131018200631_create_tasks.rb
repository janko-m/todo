class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :content
      t.integer :priority
      t.date :due_date
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
