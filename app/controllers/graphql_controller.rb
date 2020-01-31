# frozen_string_literal: true

class GraphQLController < ApplicationController
  def execute
    variables, query, operation_name = params.values_at(:variables, :query, :operationName)

    context = { 
      current_user: current_user,
      found_refresh_token: found_refresh_token,
      refresh_token_payload: refresh_token_payload
    }

    result = GraphQLMeetupSchema.execute(
      query,
      variables: ensure_hash(variables),
      context: context,
      operation_name: operation_name
    )

    render json: result
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    return {} unless ambiguous_param

    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
