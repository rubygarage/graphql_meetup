# frozen_string_literal: true

module Types
  module Base
    class Object < GraphQL::Schema::Object
      field_class Types::Base::Field
    end
  end
end
