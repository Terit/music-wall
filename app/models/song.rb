class Song < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  
  validates :title, :author, presence: true
end