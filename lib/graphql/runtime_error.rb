# frozen_string_literal: true

module GraphQL
  class RuntimeError < ExecutionError
    def to_h
      super.merge('extensions' => { 'code' => 'EXECUTION_ERROR' })
    end
  end
end
