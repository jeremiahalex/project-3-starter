# products_controller.rb
module Admin
  class ProductsController < ApplicationController
    def index
      # Show new product
    end

    def new
      # Create new product
      @new_product = Product.new
    end

    def create
      # Prevent duplicates in Products table
      unless Product.where(
        "product_name = ? AND model_no = ? AND serial_no = ?",
        product_params[:product_name],
        product_params[:model_no],
        product_params[:serial_no]
      ).count > 0
        # Save to Products table only if no duplicate
        @new_product = Product.create(product_params)
        render html: "Added to database"
      else
        render html: "Entry exists in database"
      end
    end

    def edit
    end

    def show
    end

    private

    def product_params
      params.require(:product).permit(:product_name, :model_no, :serial_no, :warranty_in_months)
    end
  end
end
