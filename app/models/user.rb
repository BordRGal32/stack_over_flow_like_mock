class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :posts
  has_many :answers

def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    return user if user && user.authenticate(password)
  end

end
