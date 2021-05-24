class WeekPoint < ApplicationRecord
  belongs_to :user

  validates :points, presence: true

  def cap_points?
    points <= 250
  end
end
