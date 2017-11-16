class LoanedItemController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @all_loaned_item = LoanedItem.not_completed(current_user.id)
  end

  def history
    @all_loaned_item = LoanedItem.completed(current_user.id)
  end
end
