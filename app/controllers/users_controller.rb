class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def update
  end

  def destroy
  end

  def change
  create_table :posts do |t|
    t.string :title
    t.text :photo

    t.timestamps null: false
  end
end
end
