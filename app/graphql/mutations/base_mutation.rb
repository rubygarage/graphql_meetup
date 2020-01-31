# frozen_string_literal: true

module Mutations
  # This class is used as a parent for all mutations, and it is the place to have common utilities
  class BaseMutation < GraphQL::Schema::Mutation
    null false

    private

    def match_operation(operation_result)
      MatchOperationResult.new.call(
        operation_result: operation_result,
        context: context
      )
    end

    def refresh_token_payload
      context[:refresh_token_payload]
    end

    def refresh_token
      context[:found_refresh_token]
    end

    def current_user
      context[:current_user]
    end
  end
end
