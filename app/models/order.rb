class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id, :state, :state_cd

  belongs_to :user
  belongs_to :place

  as_enum :state, [:fresh, :waiting, :confirmed, :rejected], prefix: true

  def check
    if VKChecker.new(self).check.success?
      confirm
    else
      wait
    end

    self
  end

  protected

  def confirm
    update_attributes(state: :confirmed) if state_fresh?
  end

  def wait
    update_attributes(state: :waiting) unless state_waiting?
  end
end
