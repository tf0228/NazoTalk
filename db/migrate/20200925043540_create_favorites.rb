class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :users, foreign_key: true
      t.references :questions, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :question_id], unique: true
  end
end
