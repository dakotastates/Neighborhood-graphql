class Vote < ApplicationRecord
  belongs_to :bulletin, validate: true
  belongs_to :user, validate: true
end
