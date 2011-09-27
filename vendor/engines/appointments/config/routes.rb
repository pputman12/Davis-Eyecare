::Refinery::Application.routes.draw do
  resources :appointments, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :appointments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
