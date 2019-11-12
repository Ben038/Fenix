class UpdateColumnName < ActiveRecord::Migration[5.2]
  def change
    add_column :accounting_data, :quarter, :integer
    remove_column :accounting_data, :quanter, :integer
    remove_column :accounting_data, :file_upload_id
    remove_column :accounting_data, :user_id
    remove_column :accounting_data, :international_client_id
  end
end
