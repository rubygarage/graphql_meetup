# frozen_string_literal: true

module Session
  module RefreshTokenSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:refreshToken).schema do
          required(:csrf).filled(:str?)
          required(:access).filled(:str?)
          required(:accessExpiresAt).filled(:str?)
        end
      end
    end
  end
end
