class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route
  has_many :tickets
  has_many :cars
  attr_accessor :places

  after_initialize do |train|
    train.places = {}
  end

  def places_count
    car_types = cars.map(&:type).uniq
    car_types.each do |car_type|
      Car::PLACES.each do |place_type, place_name|
        self.places[place_name] = self.places[place_name].to_i + count_places(car_type, place_type)
      end
    end
    self.places.delete_if { |k, v| v.zero? }
  end

  def sorted_cars
    cars.sorted(sort_from_head)
  end

  def count_places(car_type, place_type)
    cars.where(type: car_type).sum("#{place_type}_places")
  end

  validates :number, presence: true
end
