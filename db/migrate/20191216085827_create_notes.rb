class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :note
      t.string :priority
      t.string :status
      t.date :due_date

      t.timestamps
    end
  end
end
