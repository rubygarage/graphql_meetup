# frozen_string_literal: true

module Types::Connections
  class ListConnection < Types::Base::Connection
    edge_type Types::Edges::ListEdge

    graphql_name 'ListConnectionType'
  end
end
