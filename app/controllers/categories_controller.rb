class CategoriesController < ApplicationController
  def show
    category_chosen = Category.find(params[:id])
    @spaces = category_chosen.spaces
    @query = category_chosen.category_type
    render "pages/show_cat"
  end
end
