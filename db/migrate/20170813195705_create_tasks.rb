class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :priority
      t.datetime :deadline
      t.boolean :finished

      t.timestamps
    end
  end
end
