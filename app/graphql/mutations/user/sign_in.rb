# frozen_string_literal: true

module Mutations
  module User
    class SignIn < BaseMutation
      type Types::AuthTokenType

      description I18n.t('graphql.mutations.user.sign_in.desc')

      argument :input, Types::Inputs::UserSignInInput, required: true

      def resolve(input:)
        match_operation UserAuth::Operation::SignIn.call(
          params: input.to_h
        )
      end
    end
  end
end
