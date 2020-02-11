# frozen_string_literal: true

module Types
  class MovieImageType < Base::Object
    implements Types::Interfaces::ImageInterface

    graphql_name 'MovieImageType'

    I18N_PATH = 'graphql.types.movie_image_type'

    description I18n.t("#{I18N_PATH}.desc")
  end
end
