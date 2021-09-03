# frozen_string_literal: true

module Types
  module Inputs
    class AddWatchlistMovieInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.add_watchlist_movie_input'

      graphql_name 'UserAddWatchlistMovieInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id")
    end
  end
end
