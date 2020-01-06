class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.string :phone

      t.timestamps
    end
  end
end
