class AddForeignkeyToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :international_client, foreign_key: true
  end
end
