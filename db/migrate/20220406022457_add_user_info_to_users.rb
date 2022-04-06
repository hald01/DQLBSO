class AddUserInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :adress, :string
    add_column :users, :phone, :integer
  end
end
