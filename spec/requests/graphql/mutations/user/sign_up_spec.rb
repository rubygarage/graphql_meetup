# frozen_string_literal: true

describe 'mutation userSignup', type: :request do
  let(:default_variables) do
    {
      email: FFaker::Internet.email,
      password: 'password',
      password_confirmation: 'password',
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name
    }
  end

  context 'when params are valid' do
    it 'returns auth tokens' do
      graphql_post(
        query: user_signup_mutation,
        variables: variables
      )

      expect(response).to match_schema(User::SignUpSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when email is not unique' do
    let!(:user_account) { create(:user_account) }

    it 'returns error data' do
      graphql_post(
        query: user_signup_mutation,
        variables: variables(email: "  #{user_account.email}")
      )

      expect(response).to match_schema(ErrorSchema)
      expect(response.status).to be(200)
    end
  end

  def variables(attributes = {})
    { input: default_variables.merge(attributes) }
  end
end
