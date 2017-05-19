Rails.application.routes.draw do

  resources :events do
    resources :applications, except: [:index]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
