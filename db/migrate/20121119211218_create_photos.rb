class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :place_id
      t.integer :pid, default: 0
      t.string :image

      t.timestamps
    end
  end
end
