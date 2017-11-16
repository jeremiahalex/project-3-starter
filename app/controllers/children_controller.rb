class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :create_more_child, only: :new

  def index
    @new_childs = current_user.child
  end


  def create
    current_user.child.create(params.require(:child).permit(:name, :gender, :birthday, :size_id))
    if current_user.points == 0
      flash[:notice] = "Your child's information has been recorded. However, you have no points at the moment, please proceed to payment first."
      redirect_to "/profile"
    else
      flash[:notice] = "Your child's information has been recorded. Please proceed to choose your desired outfits for the following month."
      redirect_to "/choose_size_style/#{@current_user.child[0].size_id}/0"
    end
  end

  def new
    @new_child = Child.new
  end

  def edit
    @current_child = current_user.child[0]
  end

  def update ###check if needed
    @new_child = Child.find(params[:id])
    if @new_child.update(params.require(:child).permit(:name, :gender, :birthday, :size_id))
      redirect_to "/profile"
    else
      render @new_child
    end
  end

  def destroy
    Child.destroy(current_user.child[0]['id'])
    redirect_to '/profile'
  end

  def update_size
    @current_child = current_user.child[0]
    @current_child.update(params.require(:child).permit(:size_id))
    redirect_to "/choose_size_style/#{@current_child.size_id}/0"
  end

  private
  def create_more_child
    if current_user.child[0].present?
      flash[:notice] = "Sorry. Currently we only allowed for one child to be added."
      redirect_to profile_path
    end
  end

end
