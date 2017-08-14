class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = current_user.events
  end

  def create
    render html: 'create!'
  end

  def new
  end

  def edit
    render html: 'edit!'
  end

  def show
    @current_event = Event.find(params[:id])
    render :show
  end

  def update
    render html: 'update!'
  end

  def destroy
    render html: 'destroy!'
  end

end
