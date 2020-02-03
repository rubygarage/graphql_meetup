# frozen_string_literal: true

describe 'mutation refreshToken', type: :request do
  let(:user_account) { create(:user_account) }
  let(:payload) { { account_id: user_account.id } }
  let(:login) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login }

  context 'when user is authenticated by refresh token' do
    context 'when valid token' do
      it 'returns refresh access token data' do
        graphql_post(
          query: refresh_token_mutation,
          headers: { 'X-Refresh-Token': "Bearer #{login[:refresh]}" }
        )

        expect(response).to match_schema(Session::RefreshTokenSchema::Success)
        expect(response.status).to be(200)
      end
    end

    context 'when invalid token' do
      it 'returns error data' do
        graphql_post(
          query: refresh_token_mutation,
          headers: { 'X-Refresh-Token': "Bearer #{JWTAdapter.new.encode({})}" }
        )

        expect(response).to match_schema(AuthenticationErrorSchema)
        expect(response.status).to be(200)
      end
    end
  end

  context 'when user is authenticated by access token' do
    it 'returns error data' do
      graphql_post(
        query: refresh_token_mutation,
        headers: { 'Authorization': "Bearer #{login[:access]}" }
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end

  context 'when user is authenticated by flushed token' do
    before do
      login
      session = JWTSessions::Session.new
      session.flush_by_token(login[:refresh])
    end

    it 'returns error data' do
      graphql_post(
        query: refresh_token_mutation,
        headers: { 'X-Refresh-Token': "Bearer #{login[:refresh]}" }
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: refresh_token_mutation
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
