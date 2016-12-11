Rails.application.routes.draw do
  devise_for :users

  get '/import/tool', to: 'import_tools#new', as: 'import_tool'

  resources :import_tools
  resources :designers
  resources :icon_sets, path: :sets do
    resources :icons
  end

  resources :uploads
end
