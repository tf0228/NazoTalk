class AddIndexToRatings < ActiveRecord::Migration[5.2]
  def change
    add_index :ratings, [:user_id, :question_id], unique: true
  end
end
