require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user = perform(
      firstName: 'Test firstname',
      lastName: 'Test lastname',
      email: 'Test email',
      bio: 'Test bio',
      occupation: 'Test occupation',
      gender: 'Test gender',
      auth_provider: {
        credentials: {
          username: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.firstName, 'Test firstname'
    assert_equal user.lastName, 'Test lastname'
    assert_equal user.email, 'Test email'
    assert_equal user.bio, 'Test bio'
    assert_equal user.occupation, 'Test occupation'
    assert_equal user.gender, 'Test gender'
    assert_equal user.username, 'email@example.com'
  end
end
