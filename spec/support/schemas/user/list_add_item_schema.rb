# frozen_string_literal: true

module User
  module ListAddItemSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userListAddItem).schema do
          required(:id).filled(:str?)
          required(:items).each do
            required(:id).filled(:str?)
            required(:title).filled(:str?)
          end
        end
      end
    end
  end
end
