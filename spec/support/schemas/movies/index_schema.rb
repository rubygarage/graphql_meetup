# frozen_string_literal: true

require_relative '../shared/image_schema.rb'

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
          required(:node).schema do
            required(:id).filled(:str?)
            required(:title).filled(:str?)
            optional(:originalTitle).maybe(:str?)
            optional(:overview).maybe(:str?)
            required(:revenue).maybe(:int?)
            required(:budget).maybe(:int?)
            required(:runtime).maybe(:int?)
            required(:originalLanguage).maybe(:str?)
            required(:poster).schema(::Schemas::Shared::ImageSchema)
            required(:images).each do
              schema(::Schemas::Shared::ImageSchema)
            end
          end
        end
      end
    end
  end
end
