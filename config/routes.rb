Rails.application.routes.draw do
  resources :trainees
  resources :trainings
  
  resources :trainer_trainees, only: [:create, :destroy]
  resources :training_trainees, only: [:create, :destroy]
  
  resources :trainers do
    resources :trainees, only: [:index], controller: 'trainer_trainees'
  end

  resources :trainings do
    resources :trainees, only: [:index], controller: 'training_trainees'
  end
end