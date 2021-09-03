# frozen_string_literal: true

module Movie::Contract
  class AddWatchlistMovie < Reform::Form
    feature Reform::Form::Dry

    property :movie_id

    validation :default do
      configure do
        def movie_exists?(movie_id)
          Movie.exists?(id: movie_id)
        end
      end

      required(:movie_id).filled(:str?, :movie_exists?)
    end
  end
end
