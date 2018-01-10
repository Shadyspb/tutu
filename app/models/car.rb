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

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number, if: :train_id_changed?

  scope :sorted, -> (sort_from_head) { sort_from_head ? order(:number) : order(number: :desc)}

  def set_number
    self.number = train.cars.maximum(:number).to_i + 1
  end
end
