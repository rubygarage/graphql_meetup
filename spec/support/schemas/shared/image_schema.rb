# frozen_string_literal: true

module Schemas
  module Shared
    ImageSchema = Dry::Validation.Schema do
      input :hash?

      schema do
        required(:filePath).maybe(:str?)
      end
    end
  end
end
