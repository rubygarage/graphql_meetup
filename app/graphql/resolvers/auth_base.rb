# frozen_string_literal: true

module Resolvers
  class AuthBase < Base
    def authorized?(**_kwargs)
      raise JWTSessions::Errors::Unauthorized unless current_user

      true
    end
  end
end
