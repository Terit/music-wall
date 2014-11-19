class Song < ActiveRecord::Base
  has_many :votes
  has_many :reviews
  belongs_to :user
  
  validates :title, :author, presence: true
end