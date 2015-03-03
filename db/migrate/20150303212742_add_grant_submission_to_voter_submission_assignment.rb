class AddGrantSubmissionToVoterSubmissionAssignment < ActiveRecord::Migration
  def change
    add_column :voter_submission_assignments, :grant_submission, :reference
  end
end
