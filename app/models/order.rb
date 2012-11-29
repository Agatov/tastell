class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id, :state, :state_cd

  belongs_to :user
  belongs_to :place

  as_enum :state, [:fresh, :waiting, :confirmed, :rejected], prefix: true

  scope :confirmed, where(state_cd: states(:confirmed))

  before_create :can_be_created?

  def check
    if VkChecker.new(self).check.success?
      confirm
    else
      wait
    end

    self
  end

  protected

  def confirm
    update_attributes(state: :confirmed)
  end

  def wait
    update_attributes(state: :waiting) unless state_waiting?
  end

  private

  def can_be_created?
    raise OrderExceptions::TooManyOrdersError.new unless user.can_create_order?
  end
end
