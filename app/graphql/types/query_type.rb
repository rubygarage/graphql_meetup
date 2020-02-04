# frozen_string_literal: true

module Types
  class QueryType < Types::Base::Object
    field :me, resolver: Resolvers::Me, description: I18n.t('graphql.queries.me')
  end
end
