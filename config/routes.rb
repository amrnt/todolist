Todolist::Application.routes.draw do
  devise_for :users

  resources :lists, except: :new do
    resources :tasks, except: [:new, :show, :index]
  end

  root to: 'home#index'
end
