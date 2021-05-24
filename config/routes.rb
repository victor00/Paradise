Rails.application.routes.draw do
  scope '/api', defaults: { format: :json } do
    resources :users, only: %i[index create show update]
    resources :messages, only: %i[index create show]
    resources :week_points, only: %i[index create show update]
  end
end
