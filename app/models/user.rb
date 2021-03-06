class User < ApplicationRecord
  has_many :messages
  has_many :week_points

  validates :name, presence: true
  validates :nickname, uniqueness: true, presence: true
end
