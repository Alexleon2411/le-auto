class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def acept
    @status
  end

  def decline
    @status
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :card_id, :status, :start_date, :end_date)
  end
end
