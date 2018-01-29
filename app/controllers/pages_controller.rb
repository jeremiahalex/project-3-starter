class PagesController < ApplicationController
  def home
    @spaces = Space.where("is_active = ?", true).order(:created_at).reverse.first(8)
  end

  def show
    @query = params[:space]
    @spaces = Space.where("company_name ILIKE ? AND is_active = ?", "%#{@query}%", true)
  end

end
