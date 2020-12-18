module Mutations
  class CreateVote < BaseMutation
    argument :bulletin_id, ID, required: false

    type Types::VoteType

    def resolve(bulletin_id: nil)
      Vote.create!(
        bulletin: Bulletin.find(bulletin_id),
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
