class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { where(commentable_id: nil) }, dependent: :destroy
  has_many :likes, class_name: 'UserLikedPost', dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image

  validates :title, presence: true
end
