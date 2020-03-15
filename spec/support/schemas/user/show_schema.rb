# frozen_string_literal: true

require_relative '../shared/image_schema.rb'

module User
  module ShowSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:me).schema do
          required(:id).filled(:str?)
          required(:email).filled(:str?)
          required(:userProfile).schema do
            required(:id).filled(:str?)
            required(:firstName).filled(:str?)
            required(:lastName).filled(:str?)
            required(:fullName).filled(:str?)
          end
        end
      end
    end
  end
end
