class GroupsController < ApplicationController

  def index
    render html: 'show all groups within deals page'
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    update_group = Group.find(params[:id])
    update_group.users << current_user

    redirect_to restaurant_deal_group_path
  end

  def destroy
    delete_from_group = Group.find(params[:id])
    delete_from_group.users.delete(current_user)

    redirect_to restaurant_deal_group_path
  end

  # private
  #
  # def group_update_params
  #   params.require(:group).permit(:id)
  # end
end
