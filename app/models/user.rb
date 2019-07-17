class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  has_secure_password
  has_many :articles, :class_name => "Article", :foreign_key => "user_id"
  has_many :comments
end
