# frozen_string_literal: true

module Types
  class MutationType < Types::Base::Object
    field :user_sign_up, mutation: Mutations::User::SignUp
    field :user_sign_out, mutation: Mutations::User::SignOut
  end
end
