class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :international_client
  has_many :file_uploads, foreign_key: "user_id", class_name: "FileUpload"
  has_many :accounting_data, through: :file_uploads

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end


end
