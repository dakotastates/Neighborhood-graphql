class User < ApplicationRecord
  has_secure_password

# validates :firstName, presence: true
validates :username, presence: true, uniqueness: true
# validates :email, presence: true, uniqueness: true

has_many :bulletins
end
