# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_headers
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  include JWTSessions::RailsAuthorization


  private

  def found_access_token
    @_found_access_token
  end

  def found_refresh_token
    @_found_refresh_token
  end

  def not_authorized
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  def authenticate_headers
    @_found_access_token = authorize_access_token
    @_found_refresh_token = authorize_refresh_token
  end

  def authorize_access_token
    cookieless_auth(:access)
  rescue JWTSessions::Errors::Unauthorized
    nil
  end

  def authorize_refresh_token
    cookieless_auth(:refresh)
  rescue JWTSessions::Errors::Unauthorized
    nil
  end

  def refresh_token_payload
    return unless found_refresh_token

    @refresh_token_payload ||=
      begin
        token = cookieless_auth(:refresh)
        authorize_request(:refresh)

        payload.symbolize_keys.merge(token: token)
      rescue JWTSessions::Errors::Unauthorized, JWT::VerificationError
        nil
      end
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
