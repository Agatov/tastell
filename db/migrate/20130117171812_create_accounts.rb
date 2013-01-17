class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.boolean :blocked, default: false

      t.timestamps
    end

    def down
      drop_table :accounts
    end
  end
end
