class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route
  has_many :tickets
  has_many :cars
  attr_accessor :places

  scope :train_on_route, -> (id) { joins(route: :railway_stations).where("railway_station_id = ?", id) }

  after_initialize do |train|
    train.places = Hash.new(0)
  end

  def places_count
    car_types = cars.map(&:type).uniq
    car_types.each do |car_type|
      Car::PLACES.each do |place_type, place_name|
        self.places[place_name] += count_places(car_type, place_type)
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

  def self.search_by_stations(start_station, finish_station)
    Train.train_on_route(start_station) & Train.train_on_route(finish_station)
  end

  validates :number, presence: true
end
