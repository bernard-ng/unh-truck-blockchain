class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  after_create :send_default_password

  def password_required?
    return false if new_record?
    super
  end

  def send_default_password
    password = SecureRandom.hex(6)
    update(password: password)
    UserMailer.default_password(self, password).deliver_now
  end
end
