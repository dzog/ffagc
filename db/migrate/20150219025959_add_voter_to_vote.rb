class AddVoterToVote < ActiveRecord::Migration
  def change
    add_column :votes, :voter_id, :reference
  end
end
