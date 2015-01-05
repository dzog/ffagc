class AddPasswordDigestToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :password_digest, :string
  end
end
