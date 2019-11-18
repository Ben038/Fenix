# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.find(params[:id])

    # UserMailer.with(user: user).welcome
    UserMailer.with(user: user, url: params[:url] ).welcome.deliver_now
  end

end
