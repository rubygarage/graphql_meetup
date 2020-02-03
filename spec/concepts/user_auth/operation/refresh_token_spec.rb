# frozen_string_literal: true

describe UserAuth::Operation::RefreshToken, type: :operation do
  let(:payload) { { account_id: SecureRandom.uuid } }
  let(:session) { JWTSessions::Session.new(payload: payload, refresh_payload: payload) }
  let(:login) { session.login }
  let!(:refresh_token_payload) do
    data = session.send(:refresh_token_data, login[:refresh])

    {
      exp: data.expiration,
      token: data.token,
      uid: data.uid,
      account_id: payload[:account_id]
    }
  end

  def execute_operation
    described_class.call(refresh_token_payload: refresh_token_payload)
  end

  context 'when session exists' do
    it 'generates new access token' do
      operation = execute_operation
      expect(operation['result'][:access]).not_to eq login[:access]
    end
  end
end
