# frozen_string_literal: true

module Mutations
  module User
    class AddFavoriteMovie < AuthableMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.add_favorite_movie.desc')

      argument :input, Types::Inputs::AddFavoriteMovieInput, required: true

      def resolve(input:)
        match_operation Movie::Operation::AddFavorite.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
