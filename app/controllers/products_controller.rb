class ProductsController < ApplicationController
  def create
    product = Product.new(product_params)
    product.space = Space.find(13)
    product.save
    render json: product
    # render html: 'update for products'

  end



private

def product_params
  params.require(:product).permit(:title, :description, :image_url)
end

end
