class User < ActiveRecord::Base
  attr_accessible :password, :username

  validates :password, :username, presence: true
  validates :username, uniqueness: true
end
