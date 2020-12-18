module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :email, String, null: false
    field :bio, String, null: false
    field :occupation, String, null: false
    field :gender, String, null: false
    field :birthdate, GraphQL::Types::ISO8601Date, null: false
  end
end
