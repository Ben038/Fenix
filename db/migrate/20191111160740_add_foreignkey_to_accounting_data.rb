class AddForeignkeyToAccountingData < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounting_datum, :user, foreign_key: true
    add_reference :accounting_datum, :file_upload, foreign_key: true
  end
end
