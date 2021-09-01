# frozen_string_literal: true

module Types
  class RemovedMovieType < Base::Object
    I18N_PATH = 'graphql.types.removed_movie_type'

    graphql_name 'RemovedMovieType'

    description I18n.t("#{I18N_PATH}.desc")

    field :removed_movie_id,
          ID,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.removed_movie_id")
  end
end
