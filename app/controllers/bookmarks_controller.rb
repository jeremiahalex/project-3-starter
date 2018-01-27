class BookmarksController < ApplicationController
  def create
    @new_bookmark = Bookmark.new
    @new_bookmark.space_id = params[:space_id]
    @new_bookmark.user_id = current_user.id
    @new_bookmark.save
  end

  def destroy
    #code
  end
end
