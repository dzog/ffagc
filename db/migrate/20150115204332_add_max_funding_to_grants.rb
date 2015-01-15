class AddMaxFundingToGrants < ActiveRecord::Migration
  def change
    add_column :grants, :max_funding_dollars, :integer
  end
end
