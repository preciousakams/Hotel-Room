module API
  module V1
    class ReservationsController < ApplicationController
      before_action :set_reservation, only: %i[show update destroy]
        # GET /reservations
        def index
          @reservations = user_id.reservations
          if @reservations
            render_success({ message: 'Loaded all reservations', data: { reservations: @reservations } })
          else
            render_error('Ooops! Something went wrong')
          end
        end

        # POST /reservations
      def create
        @new_reservation = user_id.reservations.new(room_id: params[:room_id], date: params[:date],
                                                         user_id: params[:user_id])
        user_id(@new_reservation, 'Reservation created')
      end

        # DELETE /reservations/1
      def destroy
        @reservation = Reservation.find(params[:id])
        user_id(@reservation, 'Reservation deleted')
      end

      def reservations_params
        params.require(:reservation).permit(:date, :user_id, :room_id)
      end
    end
  end
end
