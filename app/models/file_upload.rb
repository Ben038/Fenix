class FileUpload < ApplicationRecord
  NETWORKS = ["Network 1", "Network 2", "Network 3", "Network 4"]
  YEARS = [Time.now.year - 3, Time.now.year - 2, Time.now.year - 1, Time.now.year]
  QUARTERS = ["Q1", "Q2", "Q3", "Q4"]

  belongs_to :user
  has_many :accounting_data

  validates :reinsurance_network, presence: true, inclusion: { in: NETWORKS }
  validates :balance_year, presence: true, inclusion: { in: YEARS }
  validates :quarter, presence: true, inclusion: { in: QUARTERS }
  validates :file_name, presence: true, uniqueness: true
end
