class CreateFileUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploads do |t|
      t.string :reinsurance_network
      t.string :balance_year
      t.string :quarter
      t.string :file_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
