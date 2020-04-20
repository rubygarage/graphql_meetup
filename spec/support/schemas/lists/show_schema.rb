# frozen_string_literal: true

require_relative '../shared/movie_schema.rb'

module Lists
  ShowSchema = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:list).schema do
        required(:id).filled(:str?)
        required(:name).filled(:str?)
        required(:items).each(::Schemas::Shared::MovieSchema)
      end
    end
  end
end
