class FilterFormController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index
  before_action :has_child

  def form1
    if current_user.child[0].present?
      @sizes = Size.all
      @child = current_user.child[0]
    else
      flash[:notice] = "You currently have no child information recorded in the system. Please set up your child's profile first."
      redirect_to profile_children_new_path
    end
  end

  def form2
    @child = current_user.child[0]
    @styles = Style.all
  end

  private

  def has_child
    unless current_user.child[0].present?
      flash[:notice] = "Please enter your child information first"
      redirect_to profile_children_new_path
    end
  end

end
