class AddGrantSubmissionToVote < ActiveRecord::Migration
  def change
    add_column :votes, :grant_submission_id, :reference
  end
end
