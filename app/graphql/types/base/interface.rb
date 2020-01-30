# frozen_string_literal: true

module Types
  module Base
    module Interface
      include GraphQL::Schema::Interface

      field_class Types::Base::Field
    end
  end
end
