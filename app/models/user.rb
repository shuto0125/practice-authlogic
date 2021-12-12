class User < ApplicationRecord
  # unknown attribute 'password_confirmation' for User. と出る為、
  attr_accessor :password_confirmation

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  def deliver_mail_activate_instructions!
    NotifierMailer.mail_activate_instructions(self).deliver_now
  end

  def activate!
    self.active = true
    save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    NotifierMailer.password_reset_instructions(self).deliver_now
  end

end
