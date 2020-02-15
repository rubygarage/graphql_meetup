# frozen_string_literal: true

module Types::Connections
  class MovieConnection < Types::Base::Connection
    edge_type Types::Edges::MovieEdge

    graphql_name 'MovieConnectionType'
  end
end
