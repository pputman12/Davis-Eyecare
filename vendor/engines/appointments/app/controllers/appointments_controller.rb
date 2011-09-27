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
end
