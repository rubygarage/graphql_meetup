# frozen_string_literal: true

module User
  module RemoveFavoriteMovieSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userRemoveFavoriteMovie).schema do
          required(:removedMovieId).filled(:str?)
        end
      end
    end
  end
end
