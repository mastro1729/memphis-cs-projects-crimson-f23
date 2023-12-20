class RemindersController < ApplicationController
    before_action :authenticate_customer!
    before_action :delete_past_reminders, only: [:index]

    def index
        @reminders = current_customer.reminders
        render :index
    end

    def new
        @reminder = Reminder.new
        render :new
    end

    def create
        @reminder = Reminder.new(reminder_params)
        @reminder.customer = current_customer
        @reminder.status = false

        if @reminder.save
          flash[:success] = 'Reminder created successfully.'
          redirect_to reminders_path
        else
          render :new
        end
    end

    def edit
      @reminder = current_customer.reminders.find_by(id: params[:id])
      
        if @reminder
          render :edit
        else
          flash[:alert] = 'Reminder not found.'
          redirect_to reminders_path
        end
    end

    def update
      @reminder = current_customer.reminders.find_by(id: params[:id])
        if @reminder.update(reminder_params)
          flash[:success] = 'Reminder updated successfully.'
          redirect_to reminders_path
        else
          render :edit
        end
    end

    def destroy
      @reminder = current_customer.reminders.find_by(id: params[:id])
        if @reminder
          @reminder.destroy
          flash[:success] = 'Reminder deleted successfully.'
          redirect_to reminders_path
        else
          flash[:alert] = 'Reminder not found.'
          redirect_to reminders_path
        end
    end

    def acknowledge
      @reminder = Reminder.find(params[:id])
      if @reminder.update(status: 1) && @reminder.destroy
        flash[:notice] = 'Reminder acknowledged and removed.'
      else
        flash[:alert] = 'Something went wrong in deleting the reminder.'
      end
      redirect_to reminders_path
    end

    private

    def reminder_params
    params.require(:reminder).permit(:title, :description, :date)
    end
    
    def delete_past_reminders
      current_customer.reminders.where('date < ?', Date.today).destroy_all
    end
end
