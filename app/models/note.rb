class Note < ApplicationRecord
  validates :note, presence: true
  validates :status, presence: true
  validates :priority, presence: true
end
