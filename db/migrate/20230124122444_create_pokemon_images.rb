class CreatePokemonImages < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_images do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :image_url
      
      t.timestamps
    end
  end
end
