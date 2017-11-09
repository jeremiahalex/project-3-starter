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
    redirect_to root_path
  end

  def new
    # @sizes = Size.all
    # @size_options = Size.all.map{|s| [s.name, s.id]}
    @new_child = Child.new
  end

  def edit
    @current_child = current_user.child
  end

  def update
    @new_child = Child.find(params[:id])

    if @new_child.update(params.require(:child).permit(:name, :gender, :birthday, :size_id))
      redirect_to'/profile'
    else
      render @new_child
    end
  end

end
