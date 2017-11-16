class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @new_childs = current_user.child
  end


  def create
    current_user.child.create(params.require(:child).permit(:name, :gender, :birthday, :size_id))
    if current_user.points == 0
      flash[:notice] = "Your child information have been added. Please proceed to payment"
      redirect_to "/profile"
    else
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

end
