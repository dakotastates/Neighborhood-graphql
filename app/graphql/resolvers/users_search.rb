require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::UsersSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { User.all }

  type types[Types::UserType]

  # inline input type definition for the advanced filter
  class UserFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :email_contains, String, required: false
    # argument :url_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: UserFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = User.all
    scope = scope.where('email LIKE ?', "%#{value[:email_contains]}%") if value[:email_contains]
    # scope = scope.where('url LIKE ?', "%#{value[:url_contains]}%") if value[:url_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end
