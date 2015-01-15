class AddRequestedFundingToGrantSubmissions < ActiveRecord::Migration
  def change
    add_column :grant_submissions, :requested_funding_dollars, :integer
  end
end
