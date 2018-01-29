require 'rqrcode'
# products_controller.rb
module Admin
  class ProductsController < ApplicationController
    before_action :is_admin?

    def index
      # Show all product
      @listings = Product.all
    end

    def new
      # Create new product
      @product = Product.new
    end

    def create
      # Prevent duplicates in Products table by checking for existence of exact match before creating
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
        redirect_to admin_product_path(@product.id), :notice => "Product updated"
      else
        render 'edit'
      end
    end

    def show
      @product = Product.find(params[:id])
      # Get serial number
      @url = 'https://warranted.herokuapp.com'
      @psn = @product.serial_no

      # Generate QR code of URL with serial number as parameter
      @qrcode = RQRCode::QRCode.new(@url + "?psn=#{@psn}")

      @svg = @qrcode.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 10, preserveAspectRatio: "xMidYMid meet", height: 1000, width: 1000, viewbox: "0 0 1000 1000")
    end

    def destroy
      @destroy_product = Product.find(params[:id])
      @destroy_product.destroy

      redirect_to admin_products_path, :alert => "Product deleted"
    end

    private

    def product_params
      params.require(:product).permit(:product_name, :model_no, :serial_no, :warranty_in_months)
    end
  end
end
