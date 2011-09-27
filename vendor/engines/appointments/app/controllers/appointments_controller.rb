class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end
  
  def create
    @appointment = Appointment.new(params[:appointment])
    
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end
end
