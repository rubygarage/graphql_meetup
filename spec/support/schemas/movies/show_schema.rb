# frozen_string_literal: true

require_relative '../shared/movie_schema.rb'

module Movies
  ShowSchema = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:movie).schema(::Schemas::Shared::MovieSchema)
    end
  end
end
