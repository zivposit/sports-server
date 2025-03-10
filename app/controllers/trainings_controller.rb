class TrainingsController < ApplicationController
  before_action -> { set_resource(TrainingService, :id, :training) }, only: [:show, :update, :destroy]

  def index
    trainings = TrainingService.get_all_trainings
    render json: Serializer::TrainingSerializer.new(trainings).serializable_hash
  end

  def show
    render json: Serializer::TrainingSerializer.new(@training).serializable_hash
  end

  def create
    puts training_params
    result = TrainingService.create_training(training_params)
    puts result

    if result.is_a?(Training)
      render json: Serializer::TrainingSerializer.new(result).serializable_hash, status: :created
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def update
    result = TrainingService.update_training(@training, training_params)

    if result.is_a?(Training)
      render json: Serializer::TrainingSerializer.new(result).serializable_hash, status: :ok
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def destroy
    result = TrainingService.delete_training(@training)
    render json: { message: result }
  end

  private

  def training_params
    params.require(:training).permit(
      :trainer_id, 
      :studio_id, 
      :date_time, 
      :duration, 
      :training_type_id,
      trainees: []
    )
  end
end
