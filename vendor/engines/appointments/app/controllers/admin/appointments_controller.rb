module Admin
  class AppointmentsController < Admin::BaseController

    crudify :appointment,
            :title_attribute => 'name', :xhr_paging => true

  end
end
