module Types
  class QueryType < Types::BaseObject
    # queries are just represented as fields
  # `all_links` is automatically camelcased to `allLinks`

  # field :all_bulletins, [BulletinType], null: false
  field :all_users, resolver: Resolvers::UsersSearch
  field :all_bulletins, resolver: Resolvers::BulletinsSearch

  # field :all_users, [UserType], null: false

  # this method is invoked, when `all_link` fields is being resolved
  # def all_bulletins
  #   Bulletin.all
  # end
  # def all_users
  #   User.all
  # end
  end
end
