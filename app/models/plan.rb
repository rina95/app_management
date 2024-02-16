class Plan < ApplicationRecord
  enum :app_type, {
    new_app: 0,
    upgrade_all: 1, # nang cap toan bo
    upgrade_part: 2, # nang cap 1 phan k thay doi TKTT
    upgrade_part_change_tt: 3,
    buy_outside: 4,
    cooperation_dev: 5,
    other: 4
  }, prefix: true

  enum :request_type, {
    approval_only: 0,
    present_detail: 1,
    present_overall: 2,
    other: 3
  }, prefix: true

  enum :status, {
    todo: 0,
    reviewing: 1,
    reviewed: 2,
    wait_update: 3,
    wait_comment_hd: 4,
    hd_comment: 5,
    wait_reqponse_hd: 6,
    wait_approval: 7,
    done: 8
  }, prefix: true

  belongs_to :software
  
  has_many :comments, as: :commentable

  validates :code, presence: true
  validates :software_version, presence: true
  validates :title, presence: true
  validates :expect_approval_date, presence: true
  validates :contact_user, presence: true
end
