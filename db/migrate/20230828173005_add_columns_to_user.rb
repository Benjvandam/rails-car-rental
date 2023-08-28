class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :birth_date, :date, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :owner, :boolean, default: false, null: false
  end
end
