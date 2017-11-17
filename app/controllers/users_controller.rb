class UsersController < ApplicationController
  def index
    @all_lessons = Lessons.all
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
    @user = User.find(current_user.id)
    render json: @user
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
