# frozen_string_literal: true

describe 'mutation userRemoveFavoriteMovie', type: :request do
  let(:user_account) { create :user_account }

  let(:payload) { { account_id: user_account.id } }
  let(:token) { JWTSessions::Session.new(payload: payload).login[:access] }

  let(:movie) { create :movie }
  let(:favorite_movie) { create(:favorite_movie, user_account: user_account, movie: movie) }
  let(:variables) { { input: { user_account_id: user_account.id, movie_id: movie.id } } }

  before { favorite_movie }

  context 'when user is authenticated' do
    it 'returns removed movie id' do
      graphql_post(
        query: user_remove_favorite_movie_mutation,
        variables: variables,
        headers: { 'Authorization': "Bearer #{token}" }
      )

      expect(response).to match_schema(User::RemoveFavoriteMovieSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: user_remove_favorite_movie_mutation,
        variables: variables
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
