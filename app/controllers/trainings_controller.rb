class TrainingsController < ApplicationController
  before_action -> { set_resource(TrainingService, :id, :training) }, only: [:show, :update, :destroy]

  def index
    render json: TrainingService.get_all_trainings
  end

  def show
    render json: @training
  end

  def create
    result = TrainingService.create_training(training_params)
    render json: result, status: result.is_a?(Training) ? :created : :unprocessable_entity
  end

  def update
    result = TrainingService.update_training(@training, training_params)
    render json: result, status: result.is_a?(Training) ? :ok : :unprocessable_entity
  end

  def destroy
    result = TrainingService.delete_training(@training)
    render json: result
  end

  private

  def training_params
    params
      .require(:training)
      .permit(
        :trainer_id, 
        :studio_id, 
        :date_time, 
        :duration, 
        :training_type_id
      )
  end
end
