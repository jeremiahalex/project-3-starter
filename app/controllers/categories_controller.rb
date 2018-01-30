class CategoriesController < ApplicationController
  def show
    category_chosen = Category.find(params[:id])
    # @spaces = category_chosen.spaces
    @spaces = Category.find(params[:id]).spaces.paginate(:page => params[:page], :per_page => 6)
    @query = category_chosen.category_type
    render "pages/show_cat"
  end
end
