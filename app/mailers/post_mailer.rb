class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.sent.subject
  #
  def sent(address, postcontent)
   # if Post.find_by(id: session[:post_id]).user_id
       mail(to: address, subject: "Thank you for your contact!", body: postcontent, content_type: "text/html")
   # else
   #    mail(to: User.find_by(id: session[:driver_id]).email, subject: "Thank you for your contact!", body: "uhhhh", content_type: "text/html")
   # end
  end
end