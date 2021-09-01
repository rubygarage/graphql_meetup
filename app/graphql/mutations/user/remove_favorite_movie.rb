# frozen_string_literal: true

module Mutations
  module User
    class RemoveFavoriteMovie < AuthableMutation
      type Types::RemovedMovieType

      description I18n.t('graphql.mutations.user.remove_favorite_movie.desc')

      argument :input, Types::Inputs::RemoveFavoriteMovieInput, required: true

      def resolve(input:)
        match_operation Movie::Operation::RemoveFavorite.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
