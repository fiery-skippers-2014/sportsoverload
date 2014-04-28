class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  #CR missing a user has_many comments
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
