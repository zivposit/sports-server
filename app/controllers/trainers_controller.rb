class TrainersController < ApplicationController
  before_action -> { set_resource(TrainerService, :id, :trainer) }, only: [:show, :update, :destroy]

  def index
    trainers = TrainerService.get_all_trainers
    render json: Serializer::TrainerSerializer.new(trainers).serializable_hash
  end

  def show
    render json: Serializer::TrainerSerializer.new(@trainer).serializable_hash
  end

  def create
    result = TrainerService.create_trainer(trainer_params)
    if result.is_a?(Trainer)
      render json: Serializer::TrainerSerializer.new(result).serializable_hash, status: :created
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def update
    result = TrainerService.update_trainer(@trainer, trainer_update_params)
    
    if result.is_a?(Trainer)
      render json: Serializer::TrainerSerializer.new(result).serializable_hash, status: :ok
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def destroy
    result = TrainerService.delete_trainer(@trainer)
    render json: { message: result }
  end

  private

  def trainer_params
    params.require(:trainer).permit(
      :id_number, 
      :first_name, 
      :last_name, 
      :birth_date, 
      :join_date, 
      :training_type_id
    )
  end
end
