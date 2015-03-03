class AddVoterToVoterSubmissionAssignment < ActiveRecord::Migration
  def change
    add_column :voter_submission_assignments, :voter, :reference
  end
end
