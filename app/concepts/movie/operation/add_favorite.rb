# frozen_string_literal: true

module Movie::Operation
  class AddFavorite < Trailblazer::Operation
    step :find_movie
    step :movie_exists?
    fail :not_found!, fail_fast: true
    step :already_favs?
    fail :duplicate_fav

    step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
      step :create_favorite_movie!
    }

    step :set_result

    def find_movie(ctx, params:, **)
      ctx['model'] = Movie.find_by(id: params[:movie_id])
    end

    def movie_exists?(_ctx, model:, **)
      model.present?
    end

    def not_found!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.not_found')
    end

    def already_favs?(_ctx, model:, current_user:, **)
      FavoriteMovie.find_by(movie_id: model.id, user_account_id: current_user.id).nil?
    end

    def duplicate_fav(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.duplicate_fav')
    end

    def create_favorite_movie!(_ctx, model:, current_user:, **)
      FavoriteMovie.create!(movie_id: model.id, user_account_id: current_user.id)
    end

    def set_result(ctx, model:, **)
      ctx['result'] = model
    end

    private

    def error_handler(exception, ctx)
      ctx['operation_status'] = :execution_error

      raise ActiveRecord::Rollback, exception.message
    end
  end
end
