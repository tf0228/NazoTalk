class AddDefaultToQuestion < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :average_rating, :float, null: false, default: 0.0
  end

  def down
    change_column :questions, :average_rating, :float, null: true, default: nil
  end
end
