class FileUpload < ApplicationRecord
  NETWORKS = ["Lianz", "Nerali", "Swissy", "AG & Co"]
  YEARS = [Time.now.year - 3, Time.now.year - 2, Time.now.year - 1, Time.now.year]
  QUARTERS = [1, 2, 3, 4]

  belongs_to :user
  has_many :accounting_data, dependent: :destroy

  validates :reinsurance_network, presence: true, inclusion: { in: NETWORKS }
  validates :balance_year, presence: true, inclusion: { in: YEARS }
  validates :quarter, presence: true, inclusion: { in: QUARTERS }
end
