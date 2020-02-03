# frozen_string_literal: true

module Mutations
  module Auth
    class RefreshToken < RefreshableMutation
      type Types::RefreshedAccessPayloadType

      description I18n.t('graphql.mutations.auth.refresh_token.desc')

      def resolve
        match_operation UserAuth::Operation::RefreshToken.call(
          refresh_token_payload: refresh_token_payload
        )
      end
    end
  end
end
