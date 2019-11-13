require 'csv'

class AccountingDatum < ApplicationRecord
  belongs_to :file_upload
  delegate :user, to: :file_upload
  delegate :international_client, to: :user


  def self.import(file)
    csv_options = { col_sep: ';', headers: true, header_converters: :symbol }

    CSV.foreach(file.path, csv_options) do |row|
      # row[:balance_year] = row[:balance_year].to_i   ===   MIGHT BE USEFUL
      row['user_id'] = FileUpload.last.user_id
      row['file_upload_id'] = FileUpload.last.id
      AccountingDatum.create!(row.to_hash)
    end
  end

# VISUALIZATION OVERVIEW #

# sum of claim & claim reserves / sum of premiums & prm reserves
  def self.kpi_ratio_claims(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.claim_paid_and_reserves_change
      den += row.premium_and_reserves_change
    end
    ((num / den) * 100).round(2)
  end

# sum of reinsurance and broker commissions / sum of premiums & prm reserves
  def self.kpi_ratio_commissions(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += (row.reinsurance_comm + row.broker_comm)
      den += row.premium_and_reserves_change
    end
    ((num / den) * 100).round(2)
  end

# sum of balance / sum of premiums & prm reserves
  def self.kpi_ratio_tech_bal(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.balance
      den += row.premium_and_reserves_change
    end
    ((num / den) * 100).round(2)
  end

# # VISUALIZATION COMMISSIONS #

  def self.broker_ratio_commissions(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.broker_comm
      den += row.premium
    end
    ((num / den) * 100).round(2)
  end

  def self.reins_comm_ratio(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.reinsurance_comm
      den += row.premium
    end
    ((num / den) * 100).round(2)
  end

# # VISUALIZATION ACCOUNTING DATA #

  def self.calc_premium(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.premium
    end
    tot.round(2)
  end

  def self.calc_earned_premium(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.earned_premium
    end
    tot.round(2)
  end

  def self.calc_claim_paid(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.claim_paid
    end
    tot.round(2)
  end

  def self.calc_claim_paid_and_reserves_change(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.claim_paid_and_reserves_change
    end
    tot.round(2)
  end

  def self.calc_premium_and_reserves_change(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.premium_and_reserves_change
    end
    tot.round(2)
  end

  def self.calc_reinsurance_comm(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.reinsurance_comm
    end
    tot.round(2)
  end

  def self.calc_broker_comm(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.broker_comm
    end
    tot.round(2)
  end

  def self.calc_profit_sharing(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.profit_sharing
    end
    tot.round(2)
  end

  def self.calc_taxes(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.taxes
    end
    tot.round(2)
  end

  def self.calc_interests(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.interests
    end
    tot.round(2)
  end

  def self.calc_balance(data_rows)
    tot = 0
    data_rows.each do |row|
      tot += row.balance
    end
    tot.round(2)
  end
end

# FileUpload.last.id
