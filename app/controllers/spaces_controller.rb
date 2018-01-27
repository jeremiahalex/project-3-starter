class SpacesController < ApplicationController
  def index
    #code
  end

  def show
    @indiv_space = Space.find(params[:id])
    @new_review = Review.new
    @reviews = Review.where(space_id: params[:id]).order(:created_at).reverse
  end

  def new
    #code
    @space = Space.new
    # @space_website = @space.website
  end

  def create

    new_space = Space.new(space_params)
    new_space.user = current_user || User.find(1)
    new_web = Website.create
    new_space.website = new_web
    # render json: new_space

    # new_space.website_id = new_web.id
    new_space.save

    redirect_to root_path
    # render json: new_space
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

  def website
    @website = Website.find(params[:id])
    @website.update(website_params)
    redirect_to user_path(1)
    # render html: 'update for websites'
  end

  def photo
    render html: 'update for photo'
  end

  def product
    render html: 'update for products'
  end




  private

def space_params
  params.require(:space).permit(:company_name, :summary, :category_id, :contact, :address, :description, :is_active)
end

def website_params
  params.require(:website).permit(:website, :facebook, :instagram, :googleplus, :linkedin)
end

end
