class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.default_password.subject
  #
  def default_password(user, password)
    @user = user
    @password = password

    mail to: user.email, subject: "[TruckChain] Mot de passe par défaut"
  end
end
