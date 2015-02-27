class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.date :due_on
      t.integer :order
      t.string :content
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
