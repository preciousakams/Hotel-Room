module Api
  module V1
    class RoomsController < ApplicationController
      before_action :set_room, only: %i[show update destroy]

      # POST /rooms
      def create
        @room = Room.new(room_params)

        if @room.save
          render json: @room, status: :created, location: "api/v1/#{@room}"
        else
          render json: @room.errors, status: :unprocessable_entity
        end
      end

      # DELETE /rooms/1
      def destroy
        @room.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_room
        @room = Room.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def room_params
        params.require(:room).permit(:name, :description, :size, :view, :bedding, :image)
      end
    end
  end
end
