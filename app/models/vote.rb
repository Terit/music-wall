class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  validates :user_id, :song_id, presence: true
end