# tickets_controller.rb
class Account::TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.date_created = Date.today
    @ticket.warranty_id = params[:warranty_id].to_i
    @ticket.customer_id = current_account.id
    @ticket.staff_id = Account.where(:is_admin => true).shuffle.first.id
    @ticket.is_resolved = false

    if @ticket.validate
      flash[:alert] = 'Ticket submitted'
      @ticket.save
      # render json: @ticket
      redirect_to account_ticket_path(@ticket.id)
    else
      flash[:alert] = 'Please check you have filled the ticket correctly'
      render 'new', warranty_id: @ticket.warranty_id
    end

    # render json: @ticket
    # render json: params
  end

  def show
    @customer_tickets = Array.new

    Ticket.where('customer_id = ?', current_account.id).each do |ticket|
      @customer_tickets << ticket.id
    end

    if @customer_tickets.include?(params[:id].to_i)
      @ticket = Ticket.find(params[:id])
      @warranty = Warranty.find(@ticket.warranty_id)
      @product = Product.find(@warranty.product_id)
      @staff = Account.find(@ticket.staff_id)
    else
      flash[:alert] = "You do not have a ticket with this number"
      redirect_to account_index_path
    end
  end

  # def edit
  #   @ticket = Ticket.find(params[:id])
  # end
  #
  # def update
  #   @ticket = Ticket.find(params[:id])
  # end
  #
  # def destroy
  #   @ticket = Ticket.find(params[:id])
  # end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :is_resolved, :customer_id, :warranty_id, :staff_id)
  end
end
