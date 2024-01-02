class Software < ApplicationRecord

  enum :in_memory, {
    none: 0,
    redis: 1,
    extra: 2,
    oracle: 3,
    other: 4
  }, prefix: true

  enum :sw_type, {
    web: 0,
    mobile: 1,
    report: 2,
    other: 3
  }, prefix: true

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :short_name, presence: true
  validates :use_db_link_reason, presence: true, if: :use_db_link


  has_many :apps, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :book_meetings, dependent: :destroy
end
