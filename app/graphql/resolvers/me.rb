# frozen_string_literal: true

module Resolvers
  class Me < AuthBase
    type Types::UserAccountType, null: false

    def resolve
      current_user
    end
  end
end
