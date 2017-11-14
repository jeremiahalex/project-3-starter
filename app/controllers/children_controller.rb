class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @new_childs = current_user.child
  end

  def show
    @child = Child.find(params[:id])
    render json: @child
  end

  def create
    current_user.child.create(params.require(:child).permit(:name, :gender, :birthday, :size_id))
    redirect_to "/choose_size_style/#{current_user.child[0].size_id}/0"
  end

  def new
    # @sizes = Size.all
    # @size_options = Size.all.map{|s| [s.name, s.id]}
    @new_child = Child.new
  end

  def edit
    @current_child = current_user.child[0]
  end

  def update
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
    # current_size = params[:size_id]
    # @current_child.change_size(current_size)
    redirect_to "/choose_size_style/#{@current_child.size_id}/0"
  end

end
