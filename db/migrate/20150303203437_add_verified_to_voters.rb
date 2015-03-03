class AddVerifiedToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :verified, :boolean
  end
end
