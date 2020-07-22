class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :comment
      t.string :url

      t.timestamps
    end
  end
end
