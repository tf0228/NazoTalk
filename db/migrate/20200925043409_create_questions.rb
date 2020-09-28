class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :users, foreign_key: true
      t.text :sentence
      t.string :image_id
      t.string :hint_1
      t.string :hint_2
      t.string :hint_3
      t.string :answer, null: false
      t.text :commentary
      t.string :answer_image_id
      t.float :average_rating

      t.timestamps
    end
  end
end
