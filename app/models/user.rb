class User < ApplicationRecord
  # unknown attribute 'password_confirmation' for User. と出る為、
  attr_accessor :password_confirmation

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
end
