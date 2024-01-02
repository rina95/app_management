class InternalConnectApp < ApplicationRecord
  enum :connect_type, {
    jdbc: 0,
    datastage: 1,
    golden_gate: 2,
    restful_api: 3,
    soap: 4,
    xml: 5,
    db_link: 6,
    esb: 7,
    soa: 8,
    open_api: 9,
    fpt: 10,
    cdc: 11,
    direct: 12,
    other: 13
  }, prefix: true

  belongs_to :software
  belongs_to :app
end
