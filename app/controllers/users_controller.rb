class UsersController < ApplicationController
  def show
    # === setting default space of 13 ===
    # @space = Space.find(13)
    @space = User.find(params[:id]).space
    @website = @space.website
<<<<<<< HEAD

    @bookmarks = Bookmark.where(user_id: 1) # to be changed after login / logout done
=======
    @product = Product.new
    @products = @space.products

>>>>>>> dev
  end

  def update
    #code
  end

end
