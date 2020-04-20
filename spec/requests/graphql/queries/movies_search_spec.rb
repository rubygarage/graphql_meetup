# frozen_string_literal: true

describe 'query moviesSearch', type: :request do
  let(:movies) { create_list(:movie, 2, with_movie_images: true, with_poster: true) }

  before { movies }

  context 'when signed in user' do
    let(:user_account) { create :user_account }
    let(:payload) { { account_id: user_account.id } }
    let(:auth_token) do
      JWTSessions::Session.new(payload: payload).login[:access]
    end

    it 'responds with correct schema' do
      graphql_post(
        query: movies_search_query,
        variables: {},
        headers: { 'Authorization': "Bearer #{auth_token}" }
      )

      expect(response).to match_schema(Movies::IndexSchema)
      expect(response.status).to be(200)
    end

    context 'when have filter' do
      let!(:search_movie) { create(:movie, title: 'Iron Man', with_movie_images: true, with_poster: true) }
      let(:filter) { 'Iron' }

      it 'responds with correct schema' do
        graphql_post(
          query: movies_search_query,
          variables: { filter: filter },
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )

        expect((JSON.parse response.body).dig('data', 'moviesSearch', 'totalCount')).to eq 1
        expect((JSON.parse response.body).dig('data', 'moviesSearch', 'edges').first.dig('node', 'title'))
          .to eq(search_movie.title)
        expect(response).to match_schema(Movies::IndexSchema)
        expect(response.status).to be(200)
      end
    end
  end

  context 'when guest user' do
    it 'responds with error data' do
      graphql_post(
        query: movies_search_query,
        variables: {}
      )

      expect(response).to match_schema(UnauthenticatedErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
