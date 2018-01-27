class UsersController < ApplicationController
  def show
    #code
    @space = Space.first
    @website = @space.website

    @bookmarks = Bookmark.where(user_id: 1) # to be changed after login / logout done
  end

  def update
    #code
  end

end
