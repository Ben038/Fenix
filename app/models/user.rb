class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :international_client
  has_many :file_uploads, foreign_key: "user_id", class_name: "FileUpload"
  has_many :accounting_data, through: :file_uploads

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# # not yet active -- this is from the CONSULTING HUB
# class User < ApplicationRecord
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

#   has_many :services
#   has_many :service_requests, through: :services
#   has_many :sent_requests, foreign_key: "user_id", class_name: "ServiceRequest"

#   searchkick

#   def full_name
#     first_name + " " + last_name
#   end

#   mount_uploader :profile_picture, PhotoUploader
# end
