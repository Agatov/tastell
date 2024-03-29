module ApiV1::Place
  extend ActiveSupport::Concern
  included do

    api_accessible :list do |template|
      template.add :id
      template.add :name
      template.add :address
      template.add :avatar_wide
      template.add :avatar_map
      template.add :logo_mini
      template.add :average_check
      template.add :kitchen
      template.add :address
      template.add :metro
      template.add :latitude
      template.add :longitude
      template.add :popular
      template.add :recommended
    end

  end
end