class CreateItemPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_photos do |t|
      t.references :item, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end
