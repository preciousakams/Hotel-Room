class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find(params[:user_id]).reservations
    render json: { reservation: @reservations }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'reservation created' }, status: :created
    else
      render json: { error: 'Unable to create reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    if Reservation.find(params[:id]).destroy
      render json: { message: 'reservation deleted' }
    else
      render json: { error: 'Unable to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :date, :city)
  end
end
