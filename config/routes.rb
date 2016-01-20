Rails.application.routes.draw do
  
  resources :posts
  resources :projects
  get 'welcome/index'
  root 'welcome#index'

  
  match '/musings',   to: 'static_pages#musings',        via: 'get'
  match '/projects',  to: 'static_pages#projects',       via: 'get'
  match '/contact',   to: 'static_pages#contact',        via: 'get'
  match '/musing',    to: 'static_pages#musing/show',    via: 'get'

end
