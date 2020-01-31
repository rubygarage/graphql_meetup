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

    def signout_mutation
      %(
        mutation userSignOut {
          userSignOut {
            completed
          }
        }
      )
    end
  end
end
