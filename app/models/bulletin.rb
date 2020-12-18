class Bulletin < ApplicationRecord
  belongs_to :user, optional: true
  validates :message, presence: true, length: { minimum: 1 }
  has_many :votes
end
