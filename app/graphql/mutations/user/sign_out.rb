# frozen_string_literal: true

module Mutations
  module User
    class SignOut < RefreshableMutation
      null true

      type Types::SignOutType

      description I18n.t('graphql.mutations.sign_out.desc')

      def resolve
        match_operation UserAuth::Operation::SignOut.call refresh_token: refresh_token
      end
    end
  end
end
