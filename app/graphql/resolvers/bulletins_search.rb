require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::BulletinsSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Bulletin.all }

  type types[Types::BulletinType]

  # inline input type definition for the advanced filter
  class BulletinFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :message_contains, String, required: false
    # argument :url_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: BulletinFilter, with: :apply_filter
  # option :filter, type: BulletinFilter, with: :apply_filter
  option :first, type: types.Int, with: :apply_first
  option :skip, type: types.Int, with: :apply_skip

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_skip(scope, value)
    scope.offset(value)
  end

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Bulletin.all
    scope = scope.where('message LIKE ?', "%#{value[:message_contains]}%") if value[:message_contains]
    # scope = scope.where('url LIKE ?', "%#{value[:url_contains]}%") if value[:url_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end
