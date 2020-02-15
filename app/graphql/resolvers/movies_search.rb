# frozen_string_literal: true

module Resolvers
  class MoviesSearch < AuthBase
    type Types::Connections::MovieConnection, null: false

    def resolve
      match_operation ::Movie::Operation::Index.call
    end
  end
end
