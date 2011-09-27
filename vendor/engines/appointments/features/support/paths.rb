module NavigationHelpers
  module Refinery
    module Appointments
      def path_to(page_name)
        case page_name
        when /the list of appointments/
          admin_appointments_path

         when /the new appointment form/
          new_admin_appointment_path
        else
          nil
        end
      end
    end
  end
end
