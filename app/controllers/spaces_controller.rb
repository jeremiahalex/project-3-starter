class SpacesController < ApplicationController
  def index
    #code
  end

  def show
    @indiv_space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    new_space = Space.new(space_params)
    new_space.user = current_user || User.find(1)
    new_web = Website.create
    new_space.website = new_web
    new_space.save
    redirect_to root_path
  end

  def edit
    #code
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to user_path(@space.user.id)
  end

  def website
    @website = Website.find(params[:id])
    @website.update(website_params)
    redirect_to user_path(@website.space.user)
  end


  private


def space_params
  params.require(:space).permit(:company_name, :summary, :category_id, :contact, :address, :description, :is_active, :image_url)
end

def website_params
  params.require(:website).permit(:website, :facebook, :instagram, :googleplus, :linkedin)
end


end
