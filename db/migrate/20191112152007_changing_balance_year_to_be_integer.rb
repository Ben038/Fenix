class ChangingBalanceYearToBeInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :file_uploads, :balance_year, :integer
  end
end
