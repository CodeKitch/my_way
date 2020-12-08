class CreateMyArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :my_artists do |t|
      t.string :name
    end
  end
end
