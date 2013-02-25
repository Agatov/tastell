class CreatePlaceRequisites < ActiveRecord::Migration
  def change
    create_table :place_requisites do |t|
      t.integer :place_id
      t.string :legal_address
      t.string :inn_kpp
      t.string :ogrn
      t.string :settlement_account
      t.string :correspondent_account
      t.string :bank
      t.string :bik

      t.timestamps
    end
  end
end
