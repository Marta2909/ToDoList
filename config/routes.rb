Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, only: [:new, :create] do
    collection do
      delete :multi_delete
    end
  end

end
