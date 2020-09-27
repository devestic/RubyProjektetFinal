Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    #Tar höjd för framtida förändringar med versionshanteringen
    namespace :v1 do
      #resources gör det möjligt att samla önskvärda actions på samma rad
      resources :coffe, only: [:index, :create, :destroy, :update]
    end
  end
  

end
