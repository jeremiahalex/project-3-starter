class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authenticate_user!, only: :index

  def index
    @sessions = Session.all
  end

  def show
  end

  def new
    @new_session = Session.new
  end

  def create

    @new_session = current_user.sessions.create(params.require(:session).permit(:duration, :price, :datetime, :tutor_id))

    if @new_session.save
      redirect_to root_path
    else
      render 'new'
    end

  end
end
