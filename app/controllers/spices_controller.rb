class SpicesController < ApplicationController
    wrap_parameters format: []
    def index 
        spice = Spice.all 
        render json: spice, status: :ok
    end

    def show 
        spice = Spice.find_by(id: params[:id])
        if spice
            render json: spice, status: :ok
        else
            render json: { error: "spice not_found" }, status: :not_found
        end
    end

    def create 
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: { error: "spice not_created" }, status: :not_found
        end
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else  
            render json: { error: "spice not_found" }, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            render json: { success: "spice was successfully deleted" }
        else
            render json: { error: "Spice not_found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
