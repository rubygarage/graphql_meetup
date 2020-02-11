# frozen_string_literal: true

describe 'query movie', type: :request do
  let(:movie) { create(:movie, with_movie_images: true, with_poster: true) }

  before { movie }

  context 'when signed in user' do
    let(:user_account) { create :user_account }
    let(:payload) { { account_id: user_account.id } }
    let(:auth_token) do
      JWTSessions::Session.new(payload: payload).login[:access]
    end

    context 'when movie with specified id exists' do
      it 'responds with correct schema' do
        graphql_post(
          query: movie_query,
          variables: variables,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )

        expect(response).to match_schema(Movies::ShowSchema)
        expect(response.status).to be(200)
      end
    end

    context 'when movie with specified id does NOT exist' do
      it 'responds with correct schema' do
        graphql_post(
          query: movie_query,
          variables: variables(id: Movie.last.id + 1),
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )

        expect(response).to match_schema(NotFoundSchema)
        expect(response.status).to be(200)
      end
    end
  end

  context 'when guest user' do
    it 'responds with error data' do
      graphql_post(
        query: movie_query,
        variables: variables
      )

      expect(response).to match_schema(UnauthenticatedErrorSchema)
      expect(response.status).to be(200)
    end
  end

  def variables(id: movie.id)
    { id: id }
  end
end
