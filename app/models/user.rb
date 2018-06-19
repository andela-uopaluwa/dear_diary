class User < ApplicationRecord
  has_many :daily_entries
  has_secure_password

  #fields to take from sign up form
  validates_uniqueness_of :email
end
