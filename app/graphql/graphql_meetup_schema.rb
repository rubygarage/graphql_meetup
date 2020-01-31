# frozen_string_literal: true

class GraphQLMeetupSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end

class GraphQL::Errors
  def add_backtrace(error, exception)
    error.options = { backtrace: exception.backtrace }
    error
  end
end

GraphQL::Errors.configure(GraphQLMeetupSchema) do
  GENERAL_ERRORS = [
    GraphQL::RuntimeError,
    GraphQL::AuthenticationError,
    GraphQL::ForbiddenError,
    GraphQL::UserInputError
  ].freeze

  rescue_from ActiveRecord::RecordNotFound do |exception|
    error = GraphQL::RuntimeError.new(I18n.t('graphql.errors.messages.not_found'))
    add_backtrace(error, exception) if Rails.env.development?
    error
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    error = GraphQL::RuntimeError.new(exception.record.errors.full_messages.join("\n"))
    add_backtrace(error, exception) if Rails.env.development?
    error
  end

  rescue_from JWTSessions::Errors::Unauthorized do
    GraphQL::AuthenticationError.new(I18n.t('graphql.errors.messages.not_authenticated'))
  end

  # rubocop:disable Lint/AmbiguousOperator
  rescue_from *GENERAL_ERRORS do |exception|
    exception
  end
  # rubocop:enable Lint/AmbiguousOperator

  rescue_from StandardError do |exception|
    error = GraphQL::RuntimeError.new(exception.message)
    add_backtrace(error, exception) if %w[test development].include? Rails.env
    error
  end
end
