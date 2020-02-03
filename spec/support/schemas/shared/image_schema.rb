# frozen_string_literal: true

module Schemas
  module Shared
    ImageSchema = Dry::Validation.Schema do
      input :hash?

      schema do
        required(:id).filled(:str?)
        required(:filepath).maybe(:str?)
      end
    end
  end
end
