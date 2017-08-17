class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_valid_date,
      only: [:create]
  before_action :check_valid_time,
      only: [:create]

  def index
    @all_events = current_user.events
  end

  #this route is for creating new events linked to users
  def create
    # render json: params[:event]
    temp_event = Event.create(
    name: params[:event][:name],
    location: params[:event][:location],
    date: params[:event][:date],
    time: params[:event][:time],
    budget: params[:event][:budget],
    user: current_user
    )
    redirect_to "/items?event=#{temp_event.id}"
  end

  #this route is just for getting the form to create new
  def new
    @new_event = Event.new
  end

  #edit path to show a form for editing
  def edit
    @current_event = Event.find(params[:id])
    # render html: 'edit!'
  end

  #need to link to items when ready
  def show
    @current_event = Event.find(params[:id])
    # render :show
  end

  #patch path to actually update
  def update
    current_event = Event.find(params[:id])
    event_to_update = params.require(:event).permit(:name, :location, :date, :time, :budget)
    redirect_to event_path if current_event.update(event_to_update)
    # render html: 'update!'
  end

  #delete
  def destroy
    event_to_delete = Event.find(params[:id])
    event_to_delete.destroy
    redirect_to events_path
  end

  private

  def check_valid_date
    if Date.parse(params[:event][:date]) < Date.today
      flash[:date_error] = "Please enter a date that is today or earlier"
      redirect_to new_event_path
    end
  end

  def check_valid_time
    if Date.parse(params[:event][:date]) == Date.today && Time.parse(params[:event][:time]) < Time.now
      flash[:time_error] = "Please select a time that is after now"
      redirect_to new_event_path
    end
  end

end
