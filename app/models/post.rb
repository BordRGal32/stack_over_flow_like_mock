class Post < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :name, presence: true
  validates :comment, presence: true

end
