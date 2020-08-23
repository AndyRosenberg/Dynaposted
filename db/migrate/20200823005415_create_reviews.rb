class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.string :title
      t.string :product
      t.integer :rating
      t.string :body
      t.string :img_url
      t.timestamps
    end
  end
end
