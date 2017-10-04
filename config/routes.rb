Rails.application.routes.draw do
  
  root 'number_converter#index'
  # root is the same as:
  # Get '/' => 'number_converter#index'

  # Add route for when the form is submitted
  post '/' => 'number_converter#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
