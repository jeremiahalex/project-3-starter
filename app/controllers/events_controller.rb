class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = current_user.events
  end

  #this route is for creating new events linked to users
  def create
    # render json: params[:event]
    Event.create(
    name: params[:event][:name],
    location: params[:event][:location],
    date: params[:event][:date],
    time: params[:event][:time],
    budget: params[:event][:budget],
    user: current_user
    )
    redirect_to :root
  end

  #this route is just for getting the form to create new
  def new
    @new_event = current_user.events.build
  end

  #whats the diff between edit show update???
  def edit
    render html: 'edit!'
  end

  #need to link to items when ready
  def show
    @current_event = Event.find(params[:id])
    render :show
  end

  #wz
  def update
    render html: 'update!'
  end

  #wz
  def destroy
    render html: 'destroy!'
  end

end
