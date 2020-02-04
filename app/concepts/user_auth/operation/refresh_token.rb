# frozen_string_literal: true

module UserAuth::Operation
  class RefreshToken < Trailblazer::Operation
    step :refresh
    step :set_result

    def refresh(ctx, refresh_token_payload:, **)
      session = Lib::Builders::JWTSessionBuilder.new.call(
        account_id: refresh_token_payload[:account_id]
      )

      ctx['access_token_payload'] = session.refresh(refresh_token_payload[:token])
    end

    def set_result(ctx, access_token_payload:, **)
      ctx['result'] = {
        csrf: access_token_payload[:csrf],
        access: access_token_payload[:access],
        access_expires_at: access_token_payload[:access_expires_at]
      }
    end
  end
end
