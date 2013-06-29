class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :is_done
      t.belongs_to :list

      t.timestamps
    end
    add_index :tasks, :list_id
  end
end
