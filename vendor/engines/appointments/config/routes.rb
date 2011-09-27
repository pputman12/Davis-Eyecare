::Refinery::Application.routes.draw do
  resources :appointments, :only => [:new, :create]
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :appointments do
      collection do
        post :update_positions
      end
    end
  end
end
