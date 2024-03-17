# app/controllers/tickets_controller.rb

class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
    def index
      @tickets = Ticket.all
    end
  
    def show
    end
  
    def new
      @ticket = Ticket.new
    end
  
    def edit
    end
  
    # POST /tickets
    def create
      @ticket = Ticket.new(ticket_params)
  
      if @ticket.save
        redirect_to @ticket, notice: 'Ticket was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      if @ticket.update(ticket_params)
        redirect_to @ticket, notice: 'Ticket was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /tickets/1
    def destroy
      @ticket.destroy
      redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :assigned_user_id, :due_date, :status_id, :progress)
    end
  end
  