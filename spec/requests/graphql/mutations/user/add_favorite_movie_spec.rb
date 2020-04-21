# frozen_string_literal: true

describe 'mutation userAddFavoriteMovie', type: :request do
  let(:user_account) { create :user_account }

  let(:payload) { { account_id: user_account.id } }
  let(:token) { JWTSessions::Session.new(payload: payload).login[:access] }

  let(:movie) { create :movie }
  let(:variables) { { input: { movie_id: movie.id } } }

  context 'when user is authenticated' do
    it 'returns movie data' do
      graphql_post(
        query: user_add_favorite_movie_mutation,
        variables: variables,
        headers: { 'Authorization': "Bearer #{token}" }
      )

      expect(response).to match_schema(User::AddFavoriteMovieSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: user_add_favorite_movie_mutation,
        variables: variables
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
