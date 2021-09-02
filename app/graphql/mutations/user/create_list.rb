# frozen_string_literal: true

module Mutations
  module User
    class CreateList < AuthableMutation
      type Types::UserAccountType

      description I18n.t('graphql.mutations.user.create_list.desc')

      argument :input, Types::Inputs::CreateListInput, required: true

      def resolve(input:)
        match_operation List::Operation::Create.call(
          params: input.to_h,
          current_user: context[:current_user]
        )
      end
    end
  end
end
