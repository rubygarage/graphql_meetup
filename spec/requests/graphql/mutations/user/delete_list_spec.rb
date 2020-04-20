# frozen_string_literal: true

describe 'mutation userDeleteList', type: :request do
  let(:user_account) { create :user_account }

  let(:payload) { { account_id: user_account.id } }
  let(:token) { JWTSessions::Session.new(payload: payload).login[:access] }

  let(:list) { create(:list, user_account: user_account) }
  let(:variables) { { input: { id: list.id } } }

  context 'when user is authenticated' do
    it 'returns deleted list id' do
      graphql_post(
        query: user_delete_list_mutation,
        variables: variables,
        headers: { 'Authorization': "Bearer #{token}" }
      )

      expect(response).to match_schema(User::DeleteListSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: user_delete_list_mutation,
        variables: variables
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
