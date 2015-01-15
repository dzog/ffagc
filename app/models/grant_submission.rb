class GrantSubmission < ActiveRecord::Base
  mount_uploader :proposal, GrantProposalUploader

  validates :name, :presence => true, length: { minimum: 4 }
  validates :proposal, :presence => true

  validates :grant_id, :presence => true

  #temporary hack : needs to be based on selected grant, not hardcoded here
  validates :requested_funding_dollars, :presence => true, :numericality => {:greater_than => 0, :less_than => 1001, :only_integer => true}
end
