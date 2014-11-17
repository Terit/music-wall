class CreateUsersAndVotes < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email 
      t.timestamp
    end

    create_table :votes do |t|
      t.belongs_to :song
      t.belongs_to :user
      t.integer :total_votes
    end

    add_column :songs, :user_id, :integer
  end

end
