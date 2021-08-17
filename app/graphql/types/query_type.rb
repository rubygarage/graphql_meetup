# frozen_string_literal: true

module Types
  class QueryType < Types::Base::Object
    field :me, resolver: Resolvers::Me, description: I18n.t('graphql.queries.me')

    field :movies_search,
          resolver: Resolvers::MoviesSearch,
          connection: true,
          description: I18n.t('graphql.queries.movies_search')

    field :movie,
          resolver: Resolvers::Movie,
          connection: false,
          description: I18n.t('graphql.queries.movie')

    field :list,
          resolver: Resolvers::List,
          connection: false,
          description: I18n.t('graphql.queries.list')

    field :trending_movies,
          resolver: Resolvers::TrendingMovies,
          connection: false,
          description: I18n.t('graphql.queries.trending_movies')
  end
end
