class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
  end

  def create
    @car = @train.car.new(car_params)

    if @car.save
      redirect_to [:admin, @train], notice: 'Вагон создан'
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to [:admin, @train], notice: 'Вагон изменен'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @car.destroy
    redirect_to admin_cars_url, notice: 'Вагон удален'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:type, :up_places, :down_places, :side_up_places, :side_down_places, :seat_places)
  end
end
