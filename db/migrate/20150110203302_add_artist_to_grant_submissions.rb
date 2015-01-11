class AddArtistToGrantSubmissions < ActiveRecord::Migration
  def change
    add_reference :grant_submissions, :artist, index: true
  end
end
