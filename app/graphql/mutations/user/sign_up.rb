# frozen_string_literal: true

module Mutations
  module User
    class SignUp < BaseMutation
      type Types::AuthTokenType

      description I18n.t('graphql.mutations.user.sign_up.desc')

      argument :input, Types::Inputs::UserSignUpInput, required: true

      def resolve(input:)
        match_operation UserAuth::Operation::SignUp.call(
          params: input.to_h,
          'contract.default.class' => UserAuth::Contract::SignUp
        )
      end
    end
  end
end
