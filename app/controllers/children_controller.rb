class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @new_child = current_user.child
  end

  def show
    @new_child = Child.find(params[:id])
    render json: @new_child
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
    # render json: @current_child
  end

end
