Rails.application.routes.draw do
  get 'welcome/index'

  match 'about' => 'welcome#about', via: :get

  root "welcome#index"
end
