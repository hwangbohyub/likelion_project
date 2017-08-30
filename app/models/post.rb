class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  # 유효성검사
  validates :title, presence: true, length: {minimum:1, maximum:50}
  validates :content, presence: true
  validates :user_id, presence: true
end
