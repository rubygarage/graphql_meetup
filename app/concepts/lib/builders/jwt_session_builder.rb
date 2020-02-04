# frozen_string_literal: true

module Lib::Builders
  class JWTSessionBuilder
    def initialize(session: JWTSessions::Session)
      @session = session
    end

    def call(account_id:)
      payload = { account_id: account_id }

      session.new(
        payload: payload,
        refresh_payload: payload
      )
    end

    private

    attr_reader :session
  end
end
