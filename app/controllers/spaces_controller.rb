class SpacesController < ApplicationController
  def index
    #code
  end

  def show
    @indiv_space = Space.find(params[:id])
  end

  def new
    #code
    @space = Space.new
    # @space_website = @space.website
  end

  def create

    new_space = Space.new(space_params)
    new_web = Website.new
    new_web.save
    render json: new_web
    # new_space.website_id = new_web.id
    # new_space.save

    # redirect_to root_path
    # render json: params
  end

  def edit
    #code
  end

  def update
    #code
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to user_path(params[:id])
  end





  def about
    render html: 'update for company about fields'
  end

  def websites
    render html: 'update for websites'
  end

  def photo
    render html: 'update for photo'
  end

  def products
    render html: 'update for products'
  end




  private

def space_params
  params.require(:space).permit(:company_name, :summary, :category_id, :contact, :address, :description, :is_active)
end

end
