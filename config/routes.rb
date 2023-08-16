Rails.application.routes.draw do
  get 'welcome/index'
  # When using resources you have 7 types of differente routes or you can remove resource and specify a route you want.  
  resources :coins
  resources :departamentos
  get "produtos/busca", to: "produtos#b usca", as: :busca_produto
  resources :produtos
  
  root to: 'welcome#index'
end
