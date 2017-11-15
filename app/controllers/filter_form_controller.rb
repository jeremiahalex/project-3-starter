class FilterFormController < ApplicationController
  def index
    # render json: current_user.child[0].name
    # @current_user_child_size = current_user.child[0].size_id
    # render json: @current_user_child_size
    # @link = '/choose_size_style/#{current_user.child[0].size_id}'
    # render json: @link
  end

  def form1
    @sizes = Size.all
    @child = current_user.child[0]
  end

  def form2
    @child = current_user.child[0]
    @styles = Style.all
    # render json: @styles
  end

end
