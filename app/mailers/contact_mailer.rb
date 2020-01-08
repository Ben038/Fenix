class ContactMailer < ApplicationMailer
  default from: 'info@fenix.com'

  def contact_email
      @contact = params[:contact]
      mail(to: @contact.email, subject: 'Thank you for contacting Fenix')
  end
end
