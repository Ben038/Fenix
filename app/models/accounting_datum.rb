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
    @claim_ratio = num / den
  end

# sum of reinsurance and broker commissions / sum of premiums & prm reserves
  def self.kpi_ratio_commissions(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += (row.reinsurance_comm + row.broker_comm)
      den += row.premium_and_reserves_change
    end
    @commission_ratio = num / den
  end

# sum of balance / sum of premiums & prm reserves
  def self.kpi_ratio_tech_bal(data_rows)
    num = 0
    den = 0

    data_rows.each do |row|
      num += row.balance
      den += row.premium_and_reserves_change
    end
    @balance_ratio = num / den
  end

# # VISUALIZATION COMMISSIONS #
#   def commissions_rates
#   end

# # VISUALIZATION CLAIMS #
#   def
#   end
end
