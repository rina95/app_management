class App < ApplicationRecord
  enum :app_type, {
    server_side_internal: 0,
    server_side_external: 1,
    client_side_internal: 2,
    client_side_external: 3,
    mobile: 4,
    b2b: 5,
    report: 6,
    other: 7
  }

  belongs_to :software

  has_many :library_apps
  has_many :libraries, through: :library_apps
end
