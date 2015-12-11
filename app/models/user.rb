class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :email, presence: true, format: VALID_EMAIL_REGEX

  validates :email, presence: true, format: VALID_EMAIL_REGEX
  validates :fullname, presence: true

end
