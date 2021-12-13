class BusinessesController < ApplicationController
    def index 
        businesses = Business.all 
        render json: businesses, except: [:created_at, :updated_at], status: :ok
    end

    def show 
        business = Business.find(params[:id])
        render json: business, except: [:created_at, :updated_at], status: :ok 
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Business not found"}, status: :not_found
    end

    # def show
    #     business = Business.find_by(id: params[:id])
    #     if business
    #         render json: business, status: :ok 
    #     else
    #         render json: {error: "Business not found"}, status: :not_found
    #     end
    # end 
end
