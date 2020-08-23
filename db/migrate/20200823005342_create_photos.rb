class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.string :title
      t.string :caption
      t.string :img_url
      t.timestamps
    end
  end
end
