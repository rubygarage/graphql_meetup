# frozen_string_literal: true

module Types
  class MutationType < Types::Base::Object
    field :user_sign_up, mutation: Mutations::User::SignUp
    field :user_sign_in, mutation: Mutations::User::SignIn
  end
end
