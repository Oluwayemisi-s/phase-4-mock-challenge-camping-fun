class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperShowSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: ["Validation errors"] }, status: :unprocessable_entity
    end

    private

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

end
