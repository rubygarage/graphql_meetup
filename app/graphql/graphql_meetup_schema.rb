# frozen_string_literal: true

class GraphQLMeetupSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
