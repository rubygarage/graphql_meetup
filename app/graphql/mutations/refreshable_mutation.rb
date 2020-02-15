# frozen_string_literal: true

module Mutations
  # Mutation authenticated by refresh token
  class RefreshableMutation < BaseMutation
    def ready?(**_kwargs)
      return true if refresh_token_payload.present?

      raise JWTSessions::Errors::Unauthorized
    end
  end
end
