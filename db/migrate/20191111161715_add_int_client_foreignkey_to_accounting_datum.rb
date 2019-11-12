class AddIntClientForeignkeyToAccountingDatum < ActiveRecord::Migration[5.2]
  def change
    # add_reference :accounting_data, :international_client, foreign_key: true
    remove_column :accounting_data, :international_client, :string
  end
end
