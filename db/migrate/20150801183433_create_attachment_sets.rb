class CreateAttachmentSets < ActiveRecord::Migration
  def change
    create_table :attachment_sets do |t|
      t.references :heroe_set, index: true
      t.attachment :image

      t.timestamps
    end
  end
end
