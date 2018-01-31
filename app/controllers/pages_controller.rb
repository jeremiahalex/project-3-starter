class PagesController < ApplicationController
  def home
    @spaces = Space.where("is_active = ?", true).order(:created_at).reverse.first(8)
  end

  def show
    query_string = params[:space]
    @query = query_string.split("-")[0]
    # @category_number = query_string.split("-")[1]
    #
    # if @category_number
    #   @spaces = Space.where("company_name ILIKE ? AND is_active = ? AND category_id = ?", "%#{@query}%", true, @category_number).paginate(:page => params[:page], :per_page => 50)
    # else
    #   @spaces = Space.where("company_name ILIKE ? AND is_active = ?", "%#{@query}%", true).paginate(:page => params[:page], :per_page => 50)
    # end

    @spaces = Space.where("company_name ILIKE ? AND is_active = ?", "%#{@query}%", true).paginate(:page => params[:page], :per_page => 100)

    category_list = @spaces.select("category_id").distinct
    category_array = []
    category_list.each do |cat|
      category_array.push({
        link: cat.category.category_type.split(" ").first,
        name: cat.category.category_type
      })
    end
    @categories = category_array.sort_by {
      |cat| cat[:name]
    }
  end

end
