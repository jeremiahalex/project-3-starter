class UsersController < ApplicationController
  def show
    # === setting default space of 13 ===
    # @space = Space.find(13)
    @space = User.find(params[:id]).space
    @website = @space.website if @space
    @bookmarks = Bookmark.where(user_id: current_user.id) # to be changed after login / logout done
    @product = Product.new
    @products = @space.products if @space
  end

  def update
    #code
  end

  def admin
    @admin = User.find(2)
    @spaces = Space.where(is_active: false)
  end

# might or might not need
  def index
  @users = User.all
end

end
