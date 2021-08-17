# frozen_string_literal: true

module Movie::Operation
  class Trending < Trailblazer::Operation
    step :set_result

    def set_result(ctx, **)
      ctx['result'] = ::Movie.where(id: ids)
    end

    private

    def ids
      WatchlistMovie
        .joins(:movie).group('movies.id').select('movies.id, COUNT(movies.id) AS listed')
        .order('listed DESC').limit(3).map(&:id)
    end
  end
end
