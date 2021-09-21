class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    def show 
        plants = Plant.find_by(id: params[:id])
        if plants
            render json: plants
        else 
            render json:{error: "These are not the plants you are looking for."}
        end
    end

    def create 
        plants = Plant.create(plant_params)
        render json: plants, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
