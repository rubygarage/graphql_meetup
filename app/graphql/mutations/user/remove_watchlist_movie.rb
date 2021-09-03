# frozen_string_literal: true

module Mutations
  module User
    class RemoveWatchlistMovie < AuthableMutation
      type Types::RemovedMovieType

      description I18n.t('graphql.mutations.user.remove_watchlist_movie.desc')

      argument :input, Types::Inputs::RemoveWatchlistMovieInput, required: true

      def resolve(input:)
        match_operation Movie::Operation::RemoveWatchlistMovie.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
