class Car < ApplicationRecord
  belongs_to :train
  TYPES = {
    'Купе': 'CoupeCar',
    'Плацкартный': 'RegularCar',
    'СВ': 'LuxCar',
    'Сидячий': 'SeatCar'
  }.freeze

  PLACES = {
    up: 'Верхниe',
    down: 'Нижние',
    side_up: 'Верхние боковые',
    side_down: 'Нижние боковые',
    seat: 'Сидячие'
  }.freeze

  validates :counter, uniqueness: { scope: :train_id }

  before_validation :set_counter, if: :train_id_changed?

  scope :sorted, -> (sort_from_head) { sort_from_head ? order(:counter) : order(counter: :desc)}

  def set_counter
    self.counter = train.cars.maximum(:counter).to_i + 1
  end
end
