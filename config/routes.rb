Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  match 'about' => 'welcome#about', via: :get

  root 'welcome#index'

end
