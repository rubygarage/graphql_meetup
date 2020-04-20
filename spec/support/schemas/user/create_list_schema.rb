# frozen_string_literal: true

module User
  module CreateListSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userCreateList).schema do
          required(:id).filled(:str?)
          required(:lists).schema do
            required(:nodes).each do
              required(:id).filled(:str?)
              required(:name).filled(:str?)
              required(:items).each do
                required(:id).filled(:str?)
              end
            end
          end
        end
      end
    end
  end
end
