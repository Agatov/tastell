class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id, :state, :state_cd, :moderated, :table_number, :date

  belongs_to :user
  belongs_to :place

  include OrderConcerns::Smsable

  as_enum :state, [:fresh, :waiting, :confirmed, :rejected], prefix: true

  scope :confirmed, where(state_cd: states(:confirmed))
  scope :only_moderated, where(moderated: true)
  scope :with_place, lambda { |place| where(place_id: place.id) unless place.nil? }
  scope :today, where(date: Time.now.strftime('%Y-%m-%d'))

  before_create :set_date

  def check
    if VkChecker.new(self).check.success?
      confirm
    else
      wait
    end

    self
  end

  def moderated?
    moderated
  end

  def moderate
    update_attributes(moderated: true)
  end

  protected

  def confirm
    return false if state_confirmed?

    update_attributes(state: :confirmed)

    if place.withdraw_balance
      send_notification
    end
  end

  def wait
    update_attributes(state: :waiting) unless state_waiting?
  end

  private

  def set_date
    self.date = Time.now.strftime('%Y-%m-%d')
  end
end
