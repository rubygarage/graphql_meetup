# frozen_string_literal: true

class JWTAdapter
  SECRET_BASE = Rails.application.credentials.secret_key_base
  ALGORITHM = 'HS512'

  def encode(payload)
    JWT.encode(payload, SECRET_BASE, ALGORITHM)
  end

  def decode(token)
    JWT.decode(token, SECRET_BASE, true, algorithm: ALGORITHM)
  end
end
