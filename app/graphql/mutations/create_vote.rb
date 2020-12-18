module Mutations
  class CreateVote < BaseMutation
    argument :bulletin_id, ID, required: false

    type Types::VoteType

    def resolve(bulletin_id: nil)
      Vote.create!(
        bulletin: Bulletin.find(bulletin_id),
        user: context[:current_user]
      )
    end
  end
end
