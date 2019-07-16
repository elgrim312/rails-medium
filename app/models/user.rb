class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  has_secure_password
  has_many :articles
end
