# frozen_string_literal: true

module User
  module AddWatchlistMovieSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userAddWatchlistMovie).schema do
          required(:id).filled(:str?)
          required(:title).filled(:str?)
          required(:isWatchlist).value(eql?: true)
        end
      end
    end
  end
end
