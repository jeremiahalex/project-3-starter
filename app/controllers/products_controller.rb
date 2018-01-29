class ProductsController < ApplicationController
  def create
    product = Product.new(product_params)
    product.save
    redirect_to user_path(product.space.user)
    # render html: 'update for products'

  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    # === admin scenario ===
    redirect_to space_path(params[:space_id])
  end



private

def product_params
  params.require(:product).permit(:title, :description, :image_url, :space_id)
end

end
