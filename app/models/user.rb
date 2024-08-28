class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum :role, {
    hd_pttk_tt: 1,
    both: 2,
    thu_ky: 3,
    other: 4,
  }

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }

  has_many :comments
end
