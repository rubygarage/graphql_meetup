# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def found_access_token
    @_found_access_token
  end

  def current_user
    return unless found_access_token

    @current_user ||=
      begin
        authorize_request(:access)
        UserAccount.find_by(id: payload['account_id'])
      rescue JWTSessions::Errors::Unauthorized
        nil
      end
  end
end
