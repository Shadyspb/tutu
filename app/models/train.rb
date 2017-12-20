class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route
  has_many :tickets
  has_many :cars

  def regular_up_places
    cars.regular.sum(:up_places)
  end

  def regular_down_places
    cars.regular.sum(:down_places)
  end

  def coupe_up_places
    cars.coupe.sum(:up_places)
  end

  def coupe_down_places
    cars.coupe.sum(:down_places)
  end

  validates :number, presence: true
end
