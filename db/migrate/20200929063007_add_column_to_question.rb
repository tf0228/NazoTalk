class AddColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :number, :integer
    add_index :questions, :number, unique: true
  end
end
