Rails.application.routes.draw do
  resources :trainees
  resources :trainings
  
  resources :trainer_trainees, only: [:create, :destroy]
  resources :training_trainees, only: [:create, :destroy]
  resources :trainer_trainings, only: [:index]
  
  resources :trainers do
    resources :trainees, only: [:index, :create], controller: 'trainer_trainees' 
  end

  resources :trainings do
    resources :trainees, only: [:index], controller: 'training_trainees'
  end

  get "trainers/:trainer_id/trainings", to: "trainer_trainings#index"

  resources :training_metadata, only: [] do
    collection do
      get :training_types
      get :studios
    end
  end
end
