class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # if you switch minimum length, change string in user_spec.rb test to match the length
  validates :password, presence: true, length: { minimum: 10 }
  validates :password_digest, presence: true

  

end
