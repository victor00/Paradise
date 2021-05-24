class WeekPoint < ApplicationRecord
  belongs_to :user

  validates :points, presence: true

  def add_points_if_not_capped(content)
    return if points == 250

    if points_config[content.to_sym].nil? && !points_config[content.to_sym].present?
      points
    else
      new_points = points + points_config[content.to_sym]
      update(points: new_points)
    end
  end

  private

  def points_config
    {
      "5k/5k": 50,
      "5k": 50
    }
  end
end
