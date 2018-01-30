class PagesController < ApplicationController
  def home
    @spaces = Space.where("is_active = ?", true).order(:created_at).reverse.first(8)
  end

  def show
    @query = params[:space]

    @spaces = Space.where("company_name ILIKE ? AND is_active = ?", "%#{@query}%", true)

    category_list = @spaces.select("category_id").distinct
    category_array = []
    category_list.each do |cat|
      category_array.push({
        link: cat.category.category_type.split.first,
        name: cat.category.category_type
      })
    end
    @categories = category_array.sort_by {
      |cat| cat[:name]
    }
  end

end
