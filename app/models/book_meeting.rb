class BookMeeting < ApplicationRecord
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
    present_detail: 1,
    present_overall: 2,
    other: 3
  }, prefix: true

  enum :status, {
    todo: 0,
    scheduled: 1,
    done: 2
  }, prefix: true

  belongs_to :software
  belongs_to :meeting

  validates :plan_code, presence: true
  validates :software_version, presence: true
  validates :title, presence: true
  validates :expect_meeting_date, presence: true
  validates :contact_user, presence: true
end
