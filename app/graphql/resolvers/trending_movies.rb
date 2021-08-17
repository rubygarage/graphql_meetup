# frozen_string_literal: true

module Resolvers
  class TrendingMovies < AuthBase
    type [Types::MovieType], null: false

    def resolve
      match_operation ::Movie::Operation::Trending.call
    end
  end
end
