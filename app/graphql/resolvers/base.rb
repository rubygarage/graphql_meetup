# frozen_string_literal: true

module Resolvers
  class Base < GraphQL::Schema::Resolver
    def current_user
      context[:current_user]
    end

    def match_operation(operation_result)
      MatchOperationResult.new.call(
        operation_result: operation_result,
        context: context
      )
    end
  end
end
