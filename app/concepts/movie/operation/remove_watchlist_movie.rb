# frozen_string_literal: true

module Movie::Operation
  class RemoveWatchlistMovie < Trailblazer::Operation
    step :init_model
    step :movie_exists?
    fail :not_found

    step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
      step :remove_movie!
    }

    step :set_result

    def init_model(ctx, params:, **)
      ctx[:model] = WatchlistMovie.find_by(movie_id: params[:movie_id], user_account_id: ctx[:current_user].id)
    end

    def movie_exists?(_ctx, model:, **)
      model.present?
    end

    def remove_movie!(_ctx, model:, **)
      model.destroy!
    end

    def not_found(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.not_found')
    end

    def set_result(ctx, params:, **)
      ctx['result'] = { removed_movie_id: params[:movie_id] }
    end

    private

    def error_handler(exception, ctx)
      ctx['operation_status'] = :execution_error

      raise ActiveRecord::Rollback, exception.message
    end
  end
end
