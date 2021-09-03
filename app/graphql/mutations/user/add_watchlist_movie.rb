# frozen_string_literal: true

module Mutations
  module User
    class AddWatchlistMovie < AuthableMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.add_watchlist_movie.desc')

      argument :input, Types::Inputs::AddWatchlistMovieInput, required: true

      def resolve(input:)
        match_operation Movie::Operation::AddWatchlistMovie.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
