module ApiV1::Place
  extend ActiveSupport::Concern
  included do

    api_accessible :list do |template|
      template.add :id
      template.add :name
      template.add :address
    end

  end
end