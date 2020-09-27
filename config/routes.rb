Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      #resources gör det möjligt att samla de önskvärda actions 
      resources :coffe, only: [:index, :create, :destroy, :update]
    end
  end
  

end
