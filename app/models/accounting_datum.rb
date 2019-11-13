require 'csv'

class AccountingDatum < ApplicationRecord
  belongs_to :file_upload
  delegate :user, to: :file_upload
  delegate :international_client, to: :user

  def self.import(file)
    csv_options = { col_sep: ';', headers: true, header_converters: :symbol }

    CSV.foreach(file.path, csv_options) do |row|
      # row[:balance_year] = row[:balance_year].to_i
      AccountingDatum.create!(row.to_hash)
    end
  end
end
