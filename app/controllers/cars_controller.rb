class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]

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
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :new,  status: :unprocessable_entity
  end

  def update
  end

  def edit
  end

  def destroy

  end

  private

  def set_car
    @car = Car.find(param[:id])
  end

  def car_params
  end
end
