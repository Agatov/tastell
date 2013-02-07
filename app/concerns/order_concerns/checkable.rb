module OrderConcerns
  module Checkable
    extend ActiveSupport::Concern

    included do
      attr_accessible :first_time_checked_at, :last_time_checked_at, :checks_count
      attr_accessible :likes_count, :reposts_count, :comments_count
    end

    def check
      update_checked_at
      checker = VkChecker.new(self)

      if checker.check.success?
        check_successful(checker)
      else
         check_failure
      end

      self
    end

    def check_successful(checker)
      if state_fresh? or state_waiting?
        confirm
      end

      update_attributes(
          likes_count: checker.likes_count,
          reposts_count: checker.reposts_count,
          comments_count: checker.comments_count
      )
    end

    def check_failure
      if state_fresh? or state_waiting?
        wait
      elsif state_confirmed?
        reject
      end
    end

    def set_first_time_checked_at
      update_attributes(
          first_time_checked_at: Time.now,
          last_time_checked_at: Time.now,
          checks_count: 1
      )
    end

    def update_last_time_checked_at
      update_attributes(last_time_checked_at: Time.now, checks_count: checks_count + 1)
    end

    def update_checked_at
      if state_fresh?
        set_first_time_checked_at
      else
        update_last_time_checked_at
      end
    end

  end
end