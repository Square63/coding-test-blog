class Comment < ApplicationRecord
  belongs_to :post
  has_many :replies, class_name: "Comment", foreign_key: "commentable_id"

  validates :description, presence: true
end
