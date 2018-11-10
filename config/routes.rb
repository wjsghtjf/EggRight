Rails.application.routes.draw do
  devise_for :users
  root 'main#home'
  # get 'main/index' => 'main#index'
  get 'main/home'
  get 'main/info' =>'main#info' 
  
  get 'alba/create', to: 'alba#create', as: 'alba_create'
  post 'alba/create2', to: 'alba#create2', as: 'alba_create2'
  get 'alba/edit', to: 'alba#edit', as: 'alba_edit' 
  get 'alba/delete/:alba_id'=> 'alba#delete'
  get 'alba/modify/:alba_id'=> 'alba#modify'
  
  post 'main/create/:user_id' , to: 'main#create', as: 'main_create'
  get 'main/create2/:distinguish_id/:user_id', to: 'main#create2', as: 'main_create2'
  get 'main/delete/:alba_id', to: 'main#delete', as: 'main_delete'
  get 'main/copy/:alba_count/:user_id' ,to: 'main#copy', as: 'main_copy'
  
end
