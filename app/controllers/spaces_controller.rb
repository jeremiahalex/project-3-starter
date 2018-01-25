class SpacesController < ApplicationController
  def index
    #code
  end

  def show
    #code

  end

  def new
    #code
    @space = Space.new
  end

  def create

    Space.create(space_params)
    redirect_to root_path
    # render json: params
  end

  def edit
    #code
  end

  def update
    #code
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
