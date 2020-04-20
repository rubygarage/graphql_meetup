# frozen_string_literal: true

describe 'trendingMovies query', type: :request do
  let(:user_account) { create :user_account }
  let(:movies) { create_list(:movie, 2) }

  before { movies }

  context 'when signed in user' do
    let(:payload) { { account_id: user_account.id } }
    let(:auth_token) do
      JWTSessions::Session.new(payload: payload).login[:access]
    end

    it 'returns trending movies list' do
      graphql_post(
        query: trending_movies_query,
        headers: { 'Authorization': "Bearer #{auth_token}" }
      )

      expect(response).to match_schema(Movies::TrendingSchema)
      expect(response.status).to be(200)
    end
  end

  context 'when guest user' do
    it 'responds with error data' do
      graphql_post(query: trending_movies_query)

      expect(response).to match_schema(UnauthenticatedErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
