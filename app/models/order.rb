class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id, :moderated, :table_number, :date

  belongs_to :user
  belongs_to :place

  include OrderConcerns::Smsable
  include OrderConcerns::Statable
  include OrderConcerns::Checkable

  scope :only_moderated, where(moderated: true)
  scope :with_place, lambda { |place| where(place_id: place.id) unless place.nil? }
  scope :today, where(date: Time.now.strftime('%Y-%m-%d'))

  before_create :set_date

  acts_as_api
  include ApiV1::Order

  def moderated?
    moderated
  end

  def moderate
    update_attributes(moderated: true)
  end

  def nice_date
    I18n.localize created_at, format: :dayMonth
  end

  private

  def set_date
    self.date = Time.now.strftime('%Y-%m-%d')
  end
end
