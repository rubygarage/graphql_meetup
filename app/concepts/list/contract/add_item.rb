# frozen_string_literal: true

module List::Contract
  class AddItem < Reform::Form
    feature Reform::Form::Dry

    property :movie_id, virtual: true
    property :list_id, virtual: true

    validation :default do
      configure do
        def movie_exists?(movie_id)
          Movie.exists?(id: movie_id)
        end

        def list_exists?(list_id)
          List.exists?(id: list_id)
        end
      end

      required(:movie_id).filled(:str?, :movie_exists?)
      required(:list_id).filled(:str?, :list_exists?)
    end
  end
end
