module ApiV1::User
  extend ActiveSupport::Concern
  included do

    api_accessible :short do |template|
      template.add :id
      template.add :full_name
      template.add :avatar_mini
    end

  end
end