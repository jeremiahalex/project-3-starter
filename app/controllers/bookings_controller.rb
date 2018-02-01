class BookingsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token, only: :about_post


  def home
    @all_services = Service.all
    @booking = Booking.new
    @user = User.new
  end


  def services
    @all_services = Service.all.order(created_at: :asc)
  end


  def about_post
    render json: params
  end

  def thanks
    @user = User.new
  end

  def contactus
    @user = User.new
  end

  def create
    @total_amount = 0
    services_list = params[:booking][:services_list]

    services_list.each do |service_id|
      booked_service = Service.find(service_id.to_i)
      @total_amount += booked_service.price * 100

      booked_service.slots_taken.times do |index|
        new_booking = Booking.new

        new_booking.user = current_user
        new_booking.service = booked_service
        new_booking.date = params[:booking][:date]
        new_booking.time = params[:booking][:time].to_i + index

        new_booking.save
      end
    end

    # respond_to do |format|
    #   format.js
    # end


    redirect_to thanks_path
  end



  def filter
    @matched_booking = Booking.where({time: params[:time], date: params[:date]}) #params.keys[0] is the selected time's value
    respond_to do |format|
      format.js { render json: @matched_booking}
    end
  end


  def show
    @searched_booking = Booking.find(params[:id])
  end


  def edit
    @searched_booking = Booking.find(params[:id])
  end


  def update
    @searched_booking = Booking.find(params[:id])
    @searched_booking.update(booking_params)
    redirect_to bookings_path
  end


  def destroy
    Booking.find(params[:id]).delete
    redirect_to bookings_path
  end


  def booking_params
    params.require(:booking).permit(:name, :date, :time, :service_id, :reference_number)
  end

end
