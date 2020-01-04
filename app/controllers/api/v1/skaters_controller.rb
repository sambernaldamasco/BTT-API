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
        Skill.create(skater_id: @skater.id)
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
      @skaters = Team.find(params[:team_id]).skaters.find_by(accepted: false)

      render json: @skaters.to_json(include: [:skill, :practices])
    end


    # GET /roster
    def roster_list
      @skaters = Team.find(params[:team_id]).skaters.find_by(accepted: true)

      render json: @skaters.to_json(include: [:skill, :practices])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_skater
        @skater = Skater.includes(:skill, :practices).find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def skater_params
        params.require(:skater).permit(:name, :team_id)
      end
  end

end
