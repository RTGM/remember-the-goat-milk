class AddAndRemoveColumn < ActiveRecord::Migration
  def change
    remove_column :to_dos, :order
    add_column :to_dos, :row_order, :integer
  end
end
