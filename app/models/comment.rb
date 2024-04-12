class Comment < ApplicationRecord
  enum comment_type: {
    review: 0,
    mail_hd: 1,
    other: 2
  }


  belongs_to :commentable, polymorphic: true
  belongs_to :user_id, optional: true

  validates :comment, presence: true
end
