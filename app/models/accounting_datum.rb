class AccountingDatum < ApplicationRecord
  belongs_to :file_upload
  delegate :user, to: :file_upload
  delegate :international_client, to: :user

# VISUALIZATION OVERVIEW #

# sum of claim & claim reserves / sum of premiums & prm reserves
  def self.kpi_ratio_claims(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.claim_paid_and_reserves_change
      den += row.premium_and_reserves_change
    end
    (num / den) * 100
  end

# sum of reinsurance and broker commissions / sum of premiums & prm reserves
  def self.kpi_ratio_commissions(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += (row.reinsurance_comm + row.broker_comm)
      den += row.premium_and_reserves_change
    end
    (num / den) * 100
  end

# sum of balance / sum of premiums & prm reserves
  def self.kpi_ratio_tech_bal(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.balance
      den += row.premium_and_reserves_change
    end
    (num / den) * 100
  end

# # VISUALIZATION COMMISSIONS #
#   def commissions_rates
#   end
  def self.broker_ratio_commissions(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.broker_comm
      den += row.premium
    end
    (num / den) * 100
  end

  def self.reins_comm_ratio(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.reinsurance_comm
      den += row.premium
    end
    (num / den) * 100
  end

# # VISUALIZATION CLAIMS #
#   def
#   end

end
