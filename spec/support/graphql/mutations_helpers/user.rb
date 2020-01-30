# frozen_string_literal: true

module GraphQL
  module MutationsHelper
    def user_signup_mutation
      %(
        mutation userSignUp($input: UserSignUpInput!) {
          userSignUp(input: $input) {
            access
            csrf
            refresh
          }
        }
      )
    end

    def user_signin_mutation
      %(
        mutation userSignIn(
          $email: String!,
          $password: String!
        ) {
          userSignIn(input: {
            email: $email,
            password: $password
          }) {
            access
            csrf
            refresh
          }
        }
      )
    end
  end
end
