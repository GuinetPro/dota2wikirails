class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.attachment :image
      t.text :description
      t.references :heroe, index: true
      t.boolean :active

      t.timestamps null: false
    end
  end
end
