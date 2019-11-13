class InternationalClient < ApplicationRecord
  has_many :users
  has_many :file_uploads, through: :users
  has_many :accounting_data, through: :file_uploads
  validates :name, presence: true

end
