class ChangeAttributeType < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :first_name, :string
    change_column :contacts, :last_name, :string
    change_column :contacts, :email, :string
  end
end
