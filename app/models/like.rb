class Like < ApplicationRecord
  belongs_to :imgpost
  belongs_to :user

  validates_uniqueness_of :imgpost_id, scope: :user_id
end
