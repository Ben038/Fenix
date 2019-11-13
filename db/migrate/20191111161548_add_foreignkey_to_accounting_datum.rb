 class AddForeignkeyToAccountingDatum < ActiveRecord::Migration[5.2]
  def change
    # add_reference :accounting_data, :user, foreign_key: true
    add_reference :accounting_data, :file_upload, foreign_key: true

  end
end
