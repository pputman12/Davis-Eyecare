class AppointmentsController < ApplicationController

  before_filter :find_all_appointments
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @appointment in the line below:
    present(@page)
  end

  def show
    @appointment = Appointment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @appointment in the line below:
    present(@page)
  end

protected

  def find_all_appointments
    @appointments = Appointment.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/appointments").first
  end

end
