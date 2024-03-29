class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end


  def show
    @booking = Booking.find(params[:id])
    @car =  Car.find(params[:car_id])
    @total = (@booking.end_date - @booking.start_date ).to_i * @car.price
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = Car.find(params[:car_id])
    if @booking.save
      redirect_to car_booking_path(@booking.car, @booking)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @car =  Car.find(params[:car_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @car =  Car.find(params[:car_id])
    if @booking.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def accept
    @status = "your request is accepted"
  end

  def decline
    @status = "your request has been declined"
  end

  private

  def booking_params
    params.require(:booking).permit(:car_id, :start_date, :end_date)
  end
end
