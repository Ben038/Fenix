class ChangingBalanceYearToBeInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :file_uploads, :balance_year, :string
    add_column :file_uploads, :balance_year, :integer
  end
end
