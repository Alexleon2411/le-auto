class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy, :update, :edit]

  def index
    @cars = Car.all

    if params[:query].present?
      @query = params[:query]
      @cars = Car.where("name LIKE ?", "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @user = current_user
    @car.user = @user
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price, :city, :year, photos: [])
  end
end
