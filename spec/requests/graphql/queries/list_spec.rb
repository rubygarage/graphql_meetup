# frozen_string_literal: true

describe 'list query', type: :request do
  let(:user_account) { create :user_account }
  let(:list) { create(:list, movies_count: 2, user_account: user_account) }

  before { list }

  context 'when signed in user' do
    let(:payload) { { account_id: user_account.id } }
    let(:auth_token) do
      JWTSessions::Session.new(payload: payload).login[:access]
    end

    context 'when list with specified id exists' do
      it 'responds with correct schema' do
        graphql_post(
          query: list_query,
          variables: variables,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )

        expect(response).to match_schema(Lists::ShowSchema)
        expect(response.status).to be(200)
      end
    end

    context 'when list with specified id does NOT exist' do
      it 'responds with correct schema' do
        graphql_post(
          query: list_query,
          variables: variables(id: List.last.id + 1),
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
        query: list_query,
        variables: variables
      )

      expect(response).to match_schema(UnauthenticatedErrorSchema)
      expect(response.status).to be(200)
    end
  end

  def variables(id: list.id)
    { id: id }
  end
end
