Rails.application.routes.draw do
  devise_for :users
  root 'main#home'
  get 'main/index'
  get 'main/home'
  
  get 'alba/create', to: 'alba#create', as: 'alba_create'
  
  post 'main/create/:user_id' , to: 'main#create', as: 'main_create'
  get 'main/create2/:distinguish_id/:user_id', to: 'main#create2', as: 'main_create2'
  get 'main/delete/:alba_id', to: 'main#delete', as: 'main_delete'
  get 'main/copy/:alba_count/:user_id' ,to: 'main#copy', as: 'main_copy'
  
end
