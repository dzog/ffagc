class AddContactToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :contact_name, :string
    add_column :artists, :contact_phone, :string
    add_column :artists, :contact_street, :string
    add_column :artists, :contact_city, :string
    add_column :artists, :contact_state, :string
    add_column :artists, :contact_country, :string
  end
end
