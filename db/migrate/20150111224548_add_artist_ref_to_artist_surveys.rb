class AddArtistRefToArtistSurveys < ActiveRecord::Migration
  def change
    add_reference :artist_surveys, :artist, index: true
  end
end
