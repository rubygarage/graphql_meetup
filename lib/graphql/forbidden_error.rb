# frozen_string_literal: true

module GraphQL
  class ForbiddenError < ExecutionError
    def to_h
      super.merge('extensions' => { 'code' => 'UNAUTHORIZED' })
    end
  end
end
