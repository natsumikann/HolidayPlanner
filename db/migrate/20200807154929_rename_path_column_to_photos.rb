class RenamePathColumnToPhotos < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :path, :image
  end
end
