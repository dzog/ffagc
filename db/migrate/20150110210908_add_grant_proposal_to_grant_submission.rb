class AddGrantProposalToGrantSubmission < ActiveRecord::Migration
  def change
    add_column :grant_submissions, :proposal, :string
  end
end
