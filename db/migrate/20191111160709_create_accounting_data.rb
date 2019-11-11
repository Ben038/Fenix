class CreateAccountingData < ActiveRecord::Migration[5.2]
  def change
    create_table :accounting_data do |t|
      t.integer :balance_year
      t.integer :quanter
      t.string :local_insurer
      t.string :geo_area
      t.string :country
      t.string :international_client
      t.string :product
      t.string :business_division
      t.string :local_client
      t.string :reinsurance_network
      t.string :risk
      t.string :policy_number
      t.string :benefit
      t.date :effective_date
      t.date :cancellation_date
      t.integer :premium
      t.integer :earned_premium
      t.integer :premium_and_reserves_change
      t.integer :claim_paid
      t.integer :claim_paid_and_reserves_change
      t.integer :reinsurance_comm
      t.integer :broker_comm
      t.integer :profit_sharing
      t.integer :taxes
      t.integer :interests
      t.integer :balance

      t.timestamps
    end
  end
end
