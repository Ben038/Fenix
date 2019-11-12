class UpdateIntegerToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :accounting_data, :premium, :float
    change_column :accounting_data, :earned_premium, :float
    change_column :accounting_data, :premium_and_reserves_change, :float
    change_column :accounting_data, :claim_paid, :float
    change_column :accounting_data, :claim_paid_and_reserves_change, :float
    change_column :accounting_data, :reinsurance_comm, :float
    change_column :accounting_data, :profit_sharing, :float
    change_column :accounting_data, :taxes, :float
    change_column :accounting_data, :interests, :float
    change_column :accounting_data, :balance, :float
   end
end
