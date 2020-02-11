# frozen_string_literal: true

module Types::Edges
  class MovieEdge < Types::Base::Edge
    node_type Types::MovieType

    graphql_name 'MovieEdgeType'
  end
end
