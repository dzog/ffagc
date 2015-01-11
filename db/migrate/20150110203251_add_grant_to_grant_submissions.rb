class AddGrantToGrantSubmissions < ActiveRecord::Migration
  def change
    add_reference :grant_submissions, :grant, index: true
  end
end
