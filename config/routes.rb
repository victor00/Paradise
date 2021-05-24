Rails.application.routes.draw do
  scope '/api', defaults: { format: :json } do
    resources :users, only: %i[index create show]
    resources :messages, only: %i[index create show]
    resources :week_points, only: %i[index create show]
  end
end
