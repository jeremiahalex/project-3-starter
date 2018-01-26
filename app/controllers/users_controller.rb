class UsersController < ApplicationController
  def show
    #code
    @space = Space.first
    @website = @space.website
  end

  def update
    #code
  end

end
