Rails.application.routes.draw do
  get 'welcome/index'
  resources :coins
  resources :departamentos
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  resources :produtos
  root to: "produtos#index"
end
