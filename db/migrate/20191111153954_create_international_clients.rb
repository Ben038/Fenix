class CreateInternationalClients < ActiveRecord::Migration[5.2]
  def change
    create_table :international_clients do |t|
      t.string :name

      t.timestamps
    end
  end
end
