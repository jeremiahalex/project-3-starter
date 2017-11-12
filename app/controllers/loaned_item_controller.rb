class LoanedItemController < ApplicationController
  def index
    @all_loaned_item = LoanedItem.not_completed(current_user.id)

  end
  def history
    @all_loaned_item = LoanedItem.completed(current_user.id)
  end
end
