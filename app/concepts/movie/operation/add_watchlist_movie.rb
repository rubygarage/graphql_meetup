# frozen_string_literal: true

module Movie::Operation
  class AddWatchlistMovie < Trailblazer::Operation
    step :init_model
    step Contract::Build(constant: Movie::Contract::AddWatchlistMovie)
    step Contract::Validate(), fail_fast: true
    step :not_added?
    fail :duplicate!

    step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
      step Contract::Persist()
    }

    step :set_result

    def init_model(ctx, params:, **)
      ctx[:model] = WatchlistMovie.new(movie_id: params[:movie_id], user_account_id: ctx[:current_user].id)
    end

    def not_added?(ctx, params:, **)
      !WatchlistMovie.exists?(movie_id: params[:movie_id], user_account_id: ctx[:current_user].id)
    end

    def duplicate!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.duplicate')
    end

    def set_result(ctx, params:, **)
      ctx['result'] = Movie.find_by(id: params[:movie_id])
    end

    private

    def error_handler(exception, ctx)
      ctx['operation_status'] = :execution_error

      raise ActiveRecord::Rollback, exception.message
    end
  end
end
