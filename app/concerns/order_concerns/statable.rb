module OrderConcerns
  module Statable
    extend ActiveSupport::Concern

    included do
      attr_accessible :state, :state_cd
      attr_accessible :confirmed_at, :rejected_at, :finished_at
      as_enum :state, [:fresh, :waiting, :confirmed, :rejected, :finished], prefix: true

      scope :fresh_and_waiting, where(state_cd: states(:fresh, :waiting))
      scope :confirmed, where(state_cd: states(:confirmed))
      scope :rejected, where(state_cd: states(:rejected))
      scope :finished, where(state_cd: states(:finished))
    end

    def confirm
      return false if state_confirmed?

      update_attributes(state: :confirmed, confirmed_at: Time.now)

      if place.withdraw_balance
        send_notification
      end
    end

    def wait
      update_attributes(state: :waiting)
    end

    def reject
      update_attributes(state: :rejected, rejected_at: Time.now)
    end

    def finish
      update_attributes(state: :finished, finished_at: Time.now)
    end

    def can_finish?
      return false if confirmed_at.nil?
      (Time.now - confirmed_at) / 3600 > 24
    end

  end
end