# frozen_string_literal: true

describe 'me query', type: :request do
  let!(:user_account) { create(:user_account, with_user_profile: true) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }

  context 'when user account' do
    it 'returns user_account data' do
      graphql_post(
        query: me_query,
        headers: { 'Authorization': "Bearer #{auth_token}" }
      )

      expect(response).to match_schema(User::ShowSchema::Success)
      expect(response.status).to be(200)
    end
  end

  context 'when no account' do
    it 'returns authentication error data' do
      graphql_post(
        query: me_query
      )

      expect(response).to match_schema(AuthenticationErrorSchema)
      expect(response.status).to be(200)
    end
  end
end
