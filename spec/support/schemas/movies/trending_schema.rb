# frozen_string_literal: true

require_relative '../shared/movie_schema.rb'

module Movies
  TrendingSchema = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:trendingMovies).each(::Schemas::Shared::MovieSchema)
    end
  end
end
