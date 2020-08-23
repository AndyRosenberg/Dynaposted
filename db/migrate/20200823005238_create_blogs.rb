class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.references :user, index: true
      t.string :title
      t.string :body
      t.string :img_url
      t.timestamps
    end
  end
end
