# frozen_string_literal: true

module Types
  module Inputs
    class RemoveFavoriteMovieInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.remove_favorite_movie_input'

      graphql_name 'UserRemoveFavoriteMovieInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id")
    end
  end
end
