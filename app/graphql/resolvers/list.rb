# frozen_string_literal: true

module Resolvers
  class List < AuthBase
    type Types::ListType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      match_operation ::List::Operation::Show.call(params: { id: id })
    end
  end
end
