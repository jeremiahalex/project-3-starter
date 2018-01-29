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
    @new_space = Space.new
  end

  def create
    @new_space = Space.new(space_params)
    @new_space.user = current_user || User.find(1)
    new_web = Website.create
    @new_space.website = new_web
    @new_space.save

    if @new_space.errors.any?
      error_array = []
      @new_space.errors.each do |key, value|
        error_array.push("#{key} #{value}")
      end
      flash[:alert] = error_array
      redirect_to new_space_path

    else
      redirect_to root_path
    end
  end

  def edit
    #code
  end

  def update
    # from users/admin.html.erb
    @space = Space.find(params[:id])
    @space.update(space_params)

    if current_user.is_admin
      # === admin scenario ===
      @space.user.is_owner = true
      @space.user.save
      redirect_to admin_path(current_user.id)
    else
      # === business owner scenario ===
      redirect_to user_path(current_user.id)
    end
    # render json: current_user

  end

  def destroy
    # from users/admin.html.erb
    @space = Space.find(params[:id])
    @space.destroy
    @space.website.destroy
    # === admin scenario ===
    redirect_to admin_path(current_user.id)
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
