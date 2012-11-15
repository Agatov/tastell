class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :uid
      t.integer :provider_cd
      t.string :token

      t.timestamps
    end
  end
end
