class AddColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :question_number, :integer
    add_index :questions, :question_number, unique: true
  end
end
