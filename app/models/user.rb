class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :imgposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_imgposts, through: :likes, source: :imgpost
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: {maximum: 200}

  def already_liked?(imgpost)
    self.likes.exists?(imgpost_id: imgpost.id)
  end
  
end
