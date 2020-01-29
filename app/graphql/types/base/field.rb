# frozen_string_literal: true

module Types
  module Base
    class Field < GraphQL::Schema::Field
      argument_class Types::Base::Argument

      def resolve_field(obj, args, ctx)
        resolve(obj, args, ctx)
      end
    end
  end
end
