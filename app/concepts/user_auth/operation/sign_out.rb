# frozen_string_literal: true

module UserAuth::Operation
  class SignOut < Trailblazer::Operation
    step :flush_session
    step :set_result

    def flush_session(_ctx, refresh_token:, **)
      session = JWTSessions::Session.new
      session.flush_by_token(refresh_token)
    end

    def set_result(ctx, **)
      ctx['result'] = { completed: true }
    end
  end
end
