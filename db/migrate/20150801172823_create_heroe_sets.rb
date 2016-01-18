class CreateHeroeSets < ActiveRecord::Migration
  def change
    create_table :heroe_sets do |t|
      t.string :title
      t.text :description
      t.string :rarity
      t.boolean :active
      t.references :heroe, index: true
      t.decimal :cost, precision: 10, scale: 3

      t.timestamps
    end
  end
end
