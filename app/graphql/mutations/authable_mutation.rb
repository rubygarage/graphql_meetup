# frozen_string_literal: true

module Mutations
  # Mutation authenticated by refresh token
  class AuthableMutation < BaseMutation
    def ready?(**_kwargs)
      return true if current_user.present?

      raise JWTSessions::Errors::Unauthorized
    end
  end
end
