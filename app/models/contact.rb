class Contact < ApplicationRecord
  validates :first_name, uniqueness: true, presence: true
  validates :last_name, uniqueness: true, presence: true
  validates :email, presence: true
end
