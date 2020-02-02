# frozen_string_literal: true

require_relative '../shared/image_schema.rb'

module Movie
  IndexSchema = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:movies).schema do
        required(:totalCount).filled(:int?)
        required(:pageInfo).schema do
          required(:startCursor).maybe(:str?)
          required(:endCursor).maybe(:str?)
          required(:hasNextPage).filled(:bool?)
          required(:hasPreviousPage).filled(:bool?)
        end
        required(:edges).each do
          required(:cursor).filled(:str?)
          required(:node).schema do
            required(:id).filled(:str?)
            required(:title).filled(:str?)
            optional(:originalTitle).filled(:str?)
            optional(:overview).filled(:str?)
            required(:revenue).filled(:float?)
            required(:budget).each(:float?)
            required(:runtime).each(:str?)
            required(:originalLanguage).each(:float?)
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
