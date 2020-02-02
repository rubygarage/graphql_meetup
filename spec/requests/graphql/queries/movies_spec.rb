# frozen_string_literal: true

describe 'query movies', type: :request do
  let(:movies) { create_list(:movie, 2) }

  context 'when signed in user' do
    let(:user_account) { create :user_account }
    let(:payload) { { account_id: user_account.id } }
    let(:auth_token) do
      JWTSessions::Session.new(payload: payload).login[:access]
    end

    it 'responds with correct schema' do
      graphql_post(
        query: movies_query,
        variables: {},
        headers: { 'Authorization': "Bearer #{auth_token}" }
      )

      expect(response).to match_schema(Movie::IndexSchema)
      expect(response.status).to be(200)
    end
  end

  context 'when guest user' do
    it 'responds with correct schema' do
      graphql_post(
        query: movies_query,
        variables: {}
      )

      expect(response).to match_schema(Movie::IndexSchema)
      expect(response.status).to be(200)
    end
  end
end
