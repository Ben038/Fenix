# not yet active -- this is from the CONSULTING HUB

# class Service < ApplicationRecord
#   CATEGORIES = ["Renewal", "Technical Review", "Healthcare", "Claim Experience", "Program Set-up", "Data Analytics"]
#   belongs_to :user
#   has_many :service_requests
#   validates :name, :description, :rate_per_day, :address, presence: true
#   validates :category, inclusion: { in: CATEGORIES }

#   searchkick

#   def search_data
#     {
#       name: name,
#       category: category,
#       user_name: user.full_name,
#       description: description,
#       price: rate_per_day,
#       location: address
#     }
#   end
# end
