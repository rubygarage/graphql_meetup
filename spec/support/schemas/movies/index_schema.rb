# frozen_string_literal: true

require_relative '../shared/movie_schema.rb'

module Movies
  IndexSchema = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:moviesSearch).schema do
        required(:totalCount).filled(:int?)
        required(:pageInfo).schema do
          required(:startCursor).filled(:str?)
          required(:endCursor).filled(:str?)
          required(:hasNextPage).filled(:bool?)
          required(:hasPreviousPage).filled(:bool?)
        end
        required(:edges).each do
          required(:cursor).filled(:str?)
          required(:node).schema(::Schemas::Shared::MovieSchema)
        end
      end
    end
  end
end
