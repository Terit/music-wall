class AddVoteTallyToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :total_votes, :integer
  end
end
