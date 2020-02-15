# frozen_string_literal: true

module Types
  class PosterType < Base::Object
    implements Types::Interfaces::ImageInterface

    graphql_name 'PosterType'

    I18N_PATH = 'graphql.types.poster_type'

    description I18n.t("#{I18N_PATH}.desc")
  end
end
