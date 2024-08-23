class Library < ApplicationRecord
  has_many :library_apps
  has_many :apps, through: :library_apps

  validates :name, presence: true, uniqueness: true
  validates :min_version_x, :min_version_y, :min_version_z, presence: true
  validates :min_version_x, numericality: { only_integer: true, greater_them_or_equal_to: 1}
  validates :min_version_y, :min_version_y, numericality: { only_integer: true, greater_them_or_equal_to: 0}
end
