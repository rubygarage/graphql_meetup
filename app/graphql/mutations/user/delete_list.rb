# frozen_string_literal: true

module Mutations
  module User
    class DeleteList < AuthableMutation
      type Types::DeletedListType

      description I18n.t('graphql.mutations.user.delete_list.desc')

      argument :input, Types::Inputs::DeleteInput, required: true

      def resolve(input:)
        match_operation List::Operation::Delete.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
