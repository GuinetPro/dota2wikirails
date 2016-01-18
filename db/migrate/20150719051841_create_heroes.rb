class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.string :video
      t.references :heroeattributes, index: true

      t.timestamps null: false
    end
  end
end
