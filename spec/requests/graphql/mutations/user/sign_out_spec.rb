describe 'mutation userSignOut', type: :request do
  let(:user_account) { create(:user_account) }
  let(:payload) do
    { account_id: user_account.id }
  end
  let(:login) do
    JWTSessions::Session.new(
      payload: payload,
      refresh_payload: payload
    ).login
  end

  context 'when user is authenticated by refresh token' do
    it 'removes user session' do
      graphql_post(
        query: signout_mutation,
        headers: { 'X-Refresh-Token': "Bearer #{login[:refresh]}" }
      )

      expect(response).to match_schema(DestroySessionSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when user is authenticated' do
    it 'returns error data' do
      graphql_post(
        query: signout_mutation,
        headers: { 'Authorization': "Bearer #{login[:access]}" }
      )

      expect(response).to match_schema(DestroySessionSchema::Error)
      expect(response.status).to be(200)
    end
  end

  context 'when user is NOT authenticated' do
    it 'returns error data' do
      graphql_post(
        query: signout_mutation
      )

      expect(response).to match_schema(DestroySessionSchema::Error)
      expect(response.status).to be(200)
    end
  end
end
