class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :profile, :text
    add_column :users, :rank, :integer, default: 0, null: false
    add_column :users, :image_id, :string
    add_column :users, :is_active, :boolean, null: false, default: true
  end
end
