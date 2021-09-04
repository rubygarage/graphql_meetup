# frozen_string_literal: true

module List::Operation
  class RemoveItem < Trailblazer::Operation
    step :movie_exists?
    fail :movie_not_found!, fail_fast: true
    step :init_model
    fail :list_not_found!, fail_fast: true
    step :item_added?
    fail :not_found!

    step Rescue(ActiveRecord::RecordInvalid, handler: :error_handler) {
      step :remove_item!
    }

    step :set_result

    def movie_exists?(_ctx, params:, **)
      Movie.exists?(id: params[:movie_id])
    end

    def init_model(ctx, params:, **)
      ctx[:model] = ListsMovie.find_by(list_id: params[:list_id], movie_id: params[:movie_id])
    end

    def item_added?(_ctx, model:, **)
      model.present?
    end

    def remove_item!(_ctx, model:, **)
      model.destroy!
    end

    def not_found!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.movie.item_not_added')
    end

    def list_not_found!(ctx, **)
      ctx['operation_status'] = :bad_request
      ctx['operation_message'] = I18n.t('graphql.errors.messages.list.not_found')
    end

    def movie_not_found!(ctx, **)
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
