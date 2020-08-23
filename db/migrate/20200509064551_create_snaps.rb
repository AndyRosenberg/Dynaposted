class CreateSnaps < ActiveRecord::Migration[6.0]
  def change
    create_table :snaps do |t|
      t.references :user, index: true
      t.timestamps
    end

    add_reference :snaps, :snappable, polymorphic: true, index: true
  end
end
