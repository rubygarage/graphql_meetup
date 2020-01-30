# frozen_string_literal: true

module GraphQL
  class AuthenticationError < ExecutionError
    def to_h
      super.merge('extensions' => { 'code' => 'UNAUTHENTICATED' })
    end
  end
end
