# frozen_string_literal: true

ErrorSchema = Dry::Validation.Schema do
  input :hash?

  required(:data)
  required(:errors).each do
    schema do
      required(:message).filled(:str?)
      optional(:locations).value(type?: Array).each(:hash?)
      optional(:path).value(type?: Array).each(:str?)
    end
  end
end
