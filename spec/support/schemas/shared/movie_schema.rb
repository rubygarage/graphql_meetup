# frozen_string_literal: true

require_relative '../shared/image_schema.rb'

module Schemas
  module Shared
    MovieSchema = Dry::Validation.Schema do
      input :hash?

      schema do
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
