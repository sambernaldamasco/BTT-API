module Api::V1
  class PracticesController < ApplicationController
    before_action :set_practice, only: [:show, :update, :destroy]

    # GET /practices
    def index
      @practices = Practice.all

      render json: @practices
    end

    # GET /practices/1
    def show
      render json: @practice
    end

    # POST /practices
    def create
      @practice = Practice.new(practice_params)

      if @practice.save
        render json: @practice, status: :created
      else
        render json: @practice.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /practices/1
    def update
      if @practice.update(practice_params)
        render json: @practice
      else
        render json: @practice.errors, status: :unprocessable_entity
      end
    end

    # DELETE /practices/1
    def destroy
      @practice.destroy
    end

    # GET /practicelist/:team_id
    def list
      @pratices = Practice.where(team_id: params[:team_id])

      render json: @pratices.to_json(include: [:skaters])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_practice
        @practice = Practice.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def practice_params
        params.require(:practice).permit(:date, :location, :has_happened, :team_id)
      end
  end

end
