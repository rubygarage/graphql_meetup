# frozen_string_literal: true

module Types
  class QueryType < Types::Base::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :test_field, String, null: false, description: 'An example field added by the generator'

    def test_field
      'Hello World!'
    end
  end
end
