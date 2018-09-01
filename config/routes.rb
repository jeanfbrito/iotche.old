Rails.application.routes.draw do
  post '/insert/:write_key' => 'readings#insert'
  resources :devices do
    resources :readings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
