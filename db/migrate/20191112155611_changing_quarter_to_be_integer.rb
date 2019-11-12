class ChangingQuarterToBeInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :file_uploads, :quarter, :string
    add_column :file_uploads, :quarter, :integer
  end
end
