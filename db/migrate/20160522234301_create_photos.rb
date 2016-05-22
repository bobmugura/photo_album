class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :album, index: true
      t.string :title
      t.string :url
      t.string :thumbnail_url

      t.timestamps null: false
    end
  end
end
