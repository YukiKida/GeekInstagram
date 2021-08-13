class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presenece: true
  validates :follow_id, presenece: true
end
