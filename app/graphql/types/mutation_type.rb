module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_bulletin, mutation: Mutations::CreateBulletin
    field :create_vote, mutation: Mutations::CreateVote
    field :signin_user, mutation: Mutations::SignInUser
  end
end
