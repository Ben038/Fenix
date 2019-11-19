class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @shared_url = params[:shared_url]
    @receiver = User.find(params[:receiver][:id])
    @sender = User.find(params[:sender][:id])

    mail(to: @receiver.email, subject: "Important message from #{@sender.first_name}")

  end
end
