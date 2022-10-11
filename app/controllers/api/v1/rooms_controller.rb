module Api
  module V1
    class RoomsController < ApplicationController
      before_action :set_room, only: %i[show update destroy]

      # GET /rooms
      def index
        @rooms = Room.all

        render json: @rooms, status: :ok
      end

      # GET /rooms/(id)
      def show
        render json: @room
      end

      # POST /rooms
      def create
        @room = Room.new(room_params)

        if @room.save
          render json: @room, status: :created, location: api_v1_room_path(@room)
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
