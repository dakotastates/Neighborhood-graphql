module Mutations
  class CreateBulletin < BaseMutation
    # arguments passed to the `resolve` method
    argument :message, String, required: true
    # argument :user_id, Integer, required: true

    # return type from the mutation
    type Types::BulletinType

    def resolve(message: nil)
      Bulletin.create!(
        message: message,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
