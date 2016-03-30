class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.sent.subject
  #
  def sent(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for your contact!")
  end
end