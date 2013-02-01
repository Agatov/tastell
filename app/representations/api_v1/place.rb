module ApiV1::Place
  extend ActiveSupport::Concern
  included do

    api_accessible :list do |template|
      template.add :id
      template.add :name
      template.add :address
      template.add :avatar_wide
      template.add :average_check
      template.add :kitchen
      template.add :address
      template.add :metro
    end

  end
end