class Library < ApplicationRecord
  has_many :library_apps
  has_many :apps, through: :library_apps
end
