# frozen_string_literal: true

module Shared
  module Steps
    class ActiveRecordTransaction
      extend Uber::Callable

      def self.call((_options), *, &block)
        ActiveRecord::Base.transaction { block.call }
      end
    end
  end
end
