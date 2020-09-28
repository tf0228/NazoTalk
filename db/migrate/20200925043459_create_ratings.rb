class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :users, foreign_key: true
      t.references :questions, foreign_key: true
      t.integer :value, null: false
      t.text :comment

      t.timestamps
    end
  end
end
