Rails.application.routes.draw do
  resources :dtcs, param: :pCode

  root "dtcs#index"

  #get 'dtcs/pCode/:pCode', to: 'dtcs#show', as: 'dtcs_by_pCode'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
