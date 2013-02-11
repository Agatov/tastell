module ApiV1::Order
  extend ActiveSupport::Concern
  included do

    api_accessible :list do |template|
      template.add :id
      template.add :content
      template.add :nice_date
      template.add :user, template: :short
    end

  end
end