require 'test_helper'

class Mutations::CreateBulletinTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateBulletin.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new bulletin' do
    bulletin = perform(
      message: 'http://example.com',
      user_id: 1,
    )

    assert bulletin.persisted?
    assert_equal bulletin.message, 'message'
    assert_equal bulletin.user_id, 1
  end
end
