class AccountingDatum < ApplicationRecord
  belongs_to :file_upload
  delegate :user, to: :file_upload
  delegate :international_client, to: :user

end
