class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # 유효성검사
  validates :comment, presence: true, length: {minimum:1, maximum:100}
  validates :post_id, presence: true
  validates :user_id, presence: true
end
