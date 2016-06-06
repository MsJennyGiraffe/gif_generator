class User < ActiveRecord::Base
  has_many :favorites

  has_secure_password

  validates :username, presence: true, uniqueness: true

  enum role: %w(user admin)
end
