class UpdateColumnName < ActiveRecord::Migration[5.2]
  def change
    add_column :accounting_data, :quarter, :integer
    remove_column :accounting_data, :quanter, :integer
  end
end
