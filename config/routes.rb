Rails.application.routes.draw do
  mount Cdx::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'calls/handle', to: 'calls#handle'
  post 'calls/action', to: 'calls#action'
  post 'calls/complete', to: 'calls#complete'

end
