class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.integer :host_id, null: false
      t.integer :client_id, null: false
      t.text :comment

      t.timestamps
    end
    add_index :user_comments, :host_id
    add_index :user_comments, :client_id
  end
end
