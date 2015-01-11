class GrantSubmission < ActiveRecord::Base
  mount_uploader :proposal, GrantProposalUploader

  validates :name, :presence => true, length: { minimum: 4 }
end
