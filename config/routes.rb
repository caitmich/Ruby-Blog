Rails.application.routes.draw do
  get 'welcome/index'

  # createas a comments resource within articles
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
