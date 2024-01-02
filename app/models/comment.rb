class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user_id, optional: true

  validates :comment, presence: true
end
