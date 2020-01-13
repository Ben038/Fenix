class UpdateDateToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :due_date, :date
    add_column :notes, :due_date, :string
  end
end
