module Types
  class BulletinType < Types::BaseObject
    field :id, ID, null: false
    field :message, String, null: false
    
    field :posted_by, UserType, null: true, method: :user
  end
end
