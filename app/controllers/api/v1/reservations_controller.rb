module API
  module V1
    class ReservationsController < ApplicationController
      def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          render json: { success: 'The reservation has been created successfully!' }
        else
          render json: { error: 'Please try again!' }
        end
      end

      def index
        @reservations = User.find(params[:user_id]).reservations
        @result = []
        @reservations.each do |res|
          @result << { reservation: res, room: Room.find(res.room_id) }
        end
        render json: { reservation: @result }
      end

      private

      def reservation_params
        params.permit(:user_id, :room_id, :city, :date)
      end
    end
  end
end
