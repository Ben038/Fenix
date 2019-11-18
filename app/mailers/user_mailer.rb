class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = User.find(params[:user][:id])
    @url = params[:url]
    # How to know the clicked user?
    # How to have access to the current URL?
    mail(to: @user.email, subject: 'Important message from Fenix')
  end
end
