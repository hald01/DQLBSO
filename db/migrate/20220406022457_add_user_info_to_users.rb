class AddUserInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :phone, :integer
  end
end
