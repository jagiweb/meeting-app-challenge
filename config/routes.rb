Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  post '/', to: 'dashboard#filtered_users'
  get '/:ids', to: 'dashboard#filtered_users'
end
