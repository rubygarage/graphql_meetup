# frozen_string_literal: true

module User
  module AddFavoriteMovieSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userAddFavoriteMovie).schema do
          required(:id).filled(:str?)
          required(:title).filled(:str?)
          required(:isFavorite).value(eql?: true)
        end
      end
    end
  end
end
