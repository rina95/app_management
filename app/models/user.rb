class User < ApplicationRecord
  enum :role, {
    hd_pttk_tt: 1,
    both: 2,
    thu_ky: 3,
    other: 4,
  }

  validates :name, presence: true, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }

  has_many :comments
end
