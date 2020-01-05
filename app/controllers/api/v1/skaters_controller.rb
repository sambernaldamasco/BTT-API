module Api::V1
  class SkatersController < ApplicationController
    before_action :set_skater, only: [:show, :update, :destroy]

    # GET /skaters
    def index
      @skaters = Skater.all

      render json: @skaters.to_json(include: [:skill, :practices])
    end

    # GET /skaters/1
    def show
      render json: @skater.to_json(include: [:skill, :practices])
    end

    # POST /skaters
    def create
      @skater = Skater.new(skater_params)
      if @skater.save

        if @skater.veteran
          Skill.create(veteran_params)
        else
          Skill.create(skater_id: @skater.id)
        end

        render json: @skater.to_json(include: [:skill, :practices])
      else
        render json: @skater.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /skaters/1
    def update
      if @skater.update(skater_params)
        render json: @skater.to_json(include: [:skill, :practices])
      else
        render json: @skater.errors, status: :unprocessable_entity
      end
    end

    # DELETE /skaters/1
    def destroy
      @skater.destroy
    end

    # GET /assessment
    def assessment_list
      @skaters = Team.find(params[:team_id]).skaters.where(accepted: false)

      render json: @skaters.to_json(include: [:skill, :practices])
    end


    # GET /roster
    def roster_list
      @skaters = Team.find(params[:team_id]).skaters.where(accepted: true)

      render json: @skaters.to_json(include: [:skill, :practices])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_skater
        @skater = Skater.includes(:skill, :practices).find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def skater_params
        params.require(:skater).permit(:name, :team_id, :veteran)
      end

      def veteran_params
        {lateral_movement: 3, hockey_stop: 3, plow_stop: 3, turning_toe: 3, power_slide: 3, transitions: 3, backwards_skating: 3, speed_endurance: 3, recovery: 3, pack_work: 3, strategy_adaptability: 3, awareness_communication: 3, mental_recovery: 3, skater_id: @skater.id}
      end
  end

end
