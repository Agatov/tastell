class PlaceRequisites < ActiveRecord::Base
  attr_accessible :bank, :bik, :correspondent_account, :inn_kpp, :legal_address, :ogrn, :place_id, :settlement_account

  belongs_to :place
end
