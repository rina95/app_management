class Software < ApplicationRecord
  PARAMS = %i(code name short_name sw_type use_db_link use_db_link_reason use_job_schedule use_history_data in_memory)

  enum :in_memory, {
    none: 0,
    redis: 1,
    extra: 2,
    oracle: 3,
    other: 4
  }, prefix: true

  enum :sw_type, {
    server_side: 0,
    client_side: 1,
    mobile: 2,
    report: 3,
    b2b: 4,
    other: 5
  }, prefix: true

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :short_name, presence: true
  validates :use_db_link_reason, presence: true, if: :use_db_link


  has_many :apps, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :book_meetings, dependent: :destroy

  class << self
    def import(file)
      CSV.foreach(file.path, headers: true) do |row|
        software_attributes = row.to_hash
        software = find_by(id: software_attributes["id"]) || new
        software.update(software_attributes)
        software.save!
      end
    end
  end

  private
  def self.ransackable_attributes(auth_object = nil)
    %i(code name short_name)
  end

  def self.ransackable_associations(auth_object = nil)
    ["apps", "book_meetings", "plans"]
  end
end
