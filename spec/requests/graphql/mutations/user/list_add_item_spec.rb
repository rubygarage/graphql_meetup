# frozen_string_literal: true

describe 'mutation userListAddItem', type: :request do
  let(:user_account) { create :user_account }

  let(:payload) { { account_id: user_account.id } }
  let(:token) { JWTSessions::Session.new(payload: payload).login[:access] }

  let(:movie) { create :movie }
  let(:list) { create :list, movies_count: 0, user_account: user_account }
  let(:variables) { { input: { list_id: list.id, movie_id: movie.id } } }

  context 'when user is authenticated' do
    it 'returns list data' do
      graphql_post(
        query: user_list_add_item_mutation,
        variables: variables,
        headers: { 'Authorization': "Bearer #{token}" }
      )

      expect(response).to match_schema(User::ListAddItemSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: user_list_add_item_mutation,
        variables: variables
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
