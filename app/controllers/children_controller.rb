class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def create
    current_user.child.create(params.require(:child).permit(:name, :gender, :birthday, :size_id))
    redirect_to root_path
  end

  def show
  end

  def new
    # @sizes = Size.all
    # @size_options = Size.all.map{|s| [s.name, s.id]}
    @new_child = Child.new
  end

end
