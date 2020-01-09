class Note < ApplicationRecord
  validates :comment, presence: true
  validates :status, presence: true
  validates :priority, presence: true
end
