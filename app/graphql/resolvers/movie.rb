# frozen_string_literal: true

module Resolvers
  class Movie < AuthBase
    type Types::MovieType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      match_operation ::Movie::Operation::Show.call(params: { id: id })
    end
  end
end
