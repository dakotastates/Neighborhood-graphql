module Types
  class BulletinType < Types::BaseObject
    field :id, ID, null: false
    field :message, String, null: false
  end
end
