class PagesController < ApplicationController
  def home

  end

  def show
    @query = params[:space]
    @spaces = Space.where("company_name ILIKE ?", "%#{@query}%")
  end

end
