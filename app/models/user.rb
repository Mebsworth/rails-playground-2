class User < ApplicationRecord

# /           start of regex
# \A          start of string
# [\w+\-.]+   at least one word char, plus, hyphen, or dot.
# @           literal @ sign
# [a-z\d\-.]+ at least one letter, digit, hyphen, or dot.
# \.          literal dot
# [a-z]+      at least one letter
# \z	        match end of a string
# /	          end of regex
# i	          case-insensitive
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  has_many :microposts

  validates :name, presence: true, length: { maximum: 50 }
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
