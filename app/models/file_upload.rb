class FileUpload < ApplicationRecord
  belongs_to :user
  has_many :accounting_data

end
