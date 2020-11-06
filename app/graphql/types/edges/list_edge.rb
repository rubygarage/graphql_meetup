# frozen_string_literal: true

module Types::Edges
  class ListEdge < Types::Base::Edge
    node_type Types::ListType

    graphql_name 'ListEdgeType'
  end
end
