class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :host_id, null: false
      t.integer :client_id, null: false
      t.text :text

      t.timestamps
    end
    add_index :comments, :host_id
    add_index :comments, :client_id
  end
end
