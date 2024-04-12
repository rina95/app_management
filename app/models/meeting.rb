class Meeting < ApplicationRecord
  has_many :meeting_reports
  has_many :book_meetings, through: :meeting_reports

  validates :start_date, presence: true
end
