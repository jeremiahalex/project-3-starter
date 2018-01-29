require 'rqrcode'
# products_controller.rb
module Admin
  class ProductsController < ApplicationController
    def index
      # Show new product
    end

    def new
      # Create new product
      @product = Product.new
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
        # render html: "Added to database"
        redirect_to admin_product_path(@new_product.id), :notice => "Product added to database"
      else
        # render html: "Entry exists in database"
        render 'create'
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])

      if @product.update(product_params)
        redirect_to admin_product_path(@product.id), :notice => "Product has been updated"
      else
        render 'edit'
      end
    end

    def show
      @product = Product.find(params[:id])
      # Get serial number
      @psn = @product.serial_no
      @url = 'https://warranted.herokuapp.com'
      # Generate QR code of URL with serial number as parameter
      @qrcode = RQRCode::QRCode.new(@url + "?psn=#{@psn}")

      @svg = @qrcode.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 10, preserveAspectRatio: "xMidYMid meet", height: 1000, width: 1000, viewbox: "0 0 1000 1000")
    end

    private

    def product_params
      params.require(:product).permit(:product_name, :model_no, :serial_no, :warranty_in_months)
    end
  end
end
