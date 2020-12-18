module Types
  class VoteType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :bulletin, Types::BulletinType, null: false
  end
end
