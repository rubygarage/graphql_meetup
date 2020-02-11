# frozen_string_literal: true

describe 'mutation userSignin', type: :request do
  let(:user_account) { create :user_account }
  let(:default_variables) do
    {
      input: {
        email: user_account.email,
        password: 'password'
      }
    }
  end

  context 'when correct credentials' do
    it 'returns auth tokens' do
      graphql_post(
        query: user_signin_mutation,
        variables: variables
      )

      expect(response).to match_schema(UserAuth::SignInSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when wrong credendials' do
    let(:user_account) { create(:user_account) }
    let(:default_variables) do
      {
        input: {
          email: 'gregory@gmail.com',
          password: 'password'
        }
      }
    end

    it 'returns an error info' do
      graphql_post(
        query: user_signin_mutation,
        variables: variables
      )

      expect(response).to match_schema(UnauthenticatedErrorSchema)
      expect(response.status).to be(200)
    end
  end

  def variables(attributes = {})
    default_variables.merge(attributes)
  end
end
