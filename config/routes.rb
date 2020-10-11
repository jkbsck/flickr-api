Rails.application.routes.draw do
  get 'static_pages_controller/index'
  root 'static_pages_controller#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
