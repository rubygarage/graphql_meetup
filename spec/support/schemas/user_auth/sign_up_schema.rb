# frozen_string_literal: true

module UserAuth
  module SignUpSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userSignUp).schema do
          required(:access).filled(:str?)
          required(:csrf).filled(:str?)
          required(:refresh).filled(:str?)
        end
      end
    end
  end
end
