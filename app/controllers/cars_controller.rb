class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to car_path(@car), notice: 'Вагон создан'
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Вагон изменен'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Вагон удален'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:train_id, :type, :up_places, :down_places, :side_up_places, :side_down_places, :seat_places)
  end
end
