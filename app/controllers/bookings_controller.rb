class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.user = current_user
    @booking.car = @car

    if @booking.save
      redirect_to  dashboard_path(@booking.car)
    else
      render :new, status: :unprocessable_entity
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
    params.require(:booking).permit(:car_id, :status, :start_date, :end_date)
  end
end
