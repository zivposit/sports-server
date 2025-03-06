# Directory structure:
# app/
# ├── controllers/
# │   ├── trainers_controller.rb
# │   ├── trainees_controller.rb
# │   ├── trainings_controller.rb
# ├── models/
# │   ├── trainer.rb
# │   ├── trainee.rb
# │   ├── training.rb
# │   ├── trainer_trainee.rb
# │   ├── training_trainee.rb
# ├── views/
# │   ├── trainers/
# │   ├── trainees/
# │   ├── trainings/

# models/trainer.rb
class Trainer < ApplicationRecord
    has_many :trainer_trainees
    has_many :trainees, through: :trainer_trainees
    has_many :trainings
  end
  
  # models/trainee.rb
  class Trainee < ApplicationRecord
    has_many :trainer_trainees
    has_many :trainers, through: :trainer_trainees
    has_many :training_trainees
    has_many :trainings, through: :training_trainees
  end
  
  # models/training.rb
  class Training < ApplicationRecord
    belongs_to :trainer
    belongs_to :studio
    has_many :training_trainees
    has_many :trainees, through: :training_trainees
  end
  
  # models/trainer_trainee.rb
  class TrainerTrainee < ApplicationRecord
    belongs_to :trainer
    belongs_to :trainee
  end
  
  # models/training_trainee.rb
  class TrainingTrainee < ApplicationRecord
    belongs_to :training
    belongs_to :trainee
  end
  
  # controllers/trainers_controller.rb
  class TrainersController < ApplicationController
    def index
      trainers = Trainer.all
      render json: trainers
    end
  
    def show
      trainer = Trainer.find(params[:id])
      render json: trainer
    end
  
    def create
      trainer = Trainer.new(trainer_params)
      if trainer.save
        render json: trainer, status: :created
      else
        render json: trainer.errors, status: :unprocessable_entity
      end
    end
  
    private
    def trainer_params
      params.require(:trainer).permit(:first_name, :last_name, :id_number, :birth_date, :join_date)
    end
  end
  
  # controllers/trainees_controller.rb
  class TraineesController < ApplicationController
    def index
      trainees = Trainee.all
      render json: trainees
    end
  
    def show
      trainee = Trainee.find(params[:id])
      render json: trainee
    end
  
    def create
      trainee = Trainee.new(trainee_params)
      if trainee.save
        render json: trainee, status: :created
      else
        render json: trainee.errors, status: :unprocessable_entity
      end
    end
  
    private
    def trainee_params
      params.require(:trainee).permit(:first_name, :last_name, :id_number, :birth_date, :join_date)
    end
  end
  
  # controllers/trainings_controller.rb
  class TrainingsController < ApplicationController
    def index
      trainings = Training.all
      render json: trainings
    end
  
    def show
      training = Training.find(params[:id])
      render json: training
    end
  
    def create
      training = Training.new(training_params)
      if training.save
        render json: training, status: :created
      else
        render json: training.errors, status: :unprocessable_entity
      end
    end
  
    private
    def training_params
      params.require(:training).permit(:trainer_id, :type_id, :date_time, :duration, :studio_id)
    end
  end
  