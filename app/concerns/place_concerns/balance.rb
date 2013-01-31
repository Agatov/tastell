module PlaceConcerns
  module Balance
    extend ActiveSupport::Concern

    included do

      attr_accessible :balance, :credit

      before_create :init_balance
      before_create :init_credit
    end

    def init_balance
      self.balance = 200
    end

    def init_credit
      self.credit = 100
    end

    def withdraw_balance
      return false unless recommendable?

      if balance > 0
        update_attributes(balance: balance - 1)
      else
        update_attributes(credit: credit - 1)
      end
    end

    def recommendable?
      (balance + credit) > 0
    end

  end
end