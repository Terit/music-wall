class User < ActiveRecord::Base
  has_many :votes
  has_many :songs
  has_many :reviews

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
end