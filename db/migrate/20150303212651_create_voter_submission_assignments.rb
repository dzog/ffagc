class CreateVoterSubmissionAssignments < ActiveRecord::Migration
  def change
    create_table :voter_submission_assignments do |t|

      t.timestamps
    end
  end
end
