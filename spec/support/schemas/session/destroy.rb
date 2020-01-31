# frozen_string_literal: true

module DestroySessionSchema
  Error = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:userSignOut).maybe(:bool?)
    end
  end

  Success = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:userSignOut).schema do
        required(:completed).filled(:bool?)
      end
    end
  end
end
