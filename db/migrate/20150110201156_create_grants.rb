class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :name

      t.timestamps
    end
  end
end
