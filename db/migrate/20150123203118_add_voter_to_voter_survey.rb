class AddVoterToVoterSurvey < ActiveRecord::Migration
  def change
    add_reference :voter_surveys, :voter, index: true
  end
end
