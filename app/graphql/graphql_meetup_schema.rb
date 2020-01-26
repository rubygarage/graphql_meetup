# frozen_string_literal: true

class GraphqlMeetupSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
