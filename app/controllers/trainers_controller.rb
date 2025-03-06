class TrainersController < ApplicationController
  before_action -> { set_resource(TrainerService, :id, :trainer) }, only: [:show, :update, :destroy]

  def index
    render json: TrainerService.get_all_trainers
  end

  def show
    render json: @trainer
  end

  def create
    result = TrainerService.create_trainer(trainer_params)
    render json: result, status: result.is_a?(Trainer) ? :created : :unprocessable_entity
  end

  def update
    result = TrainerService.update_trainer(@trainer, trainer_update_params)
    render json: result, status: result.is_a?(Trainer) ? :ok : :unprocessable_entity
  end

  def destroy
    result = TrainerService.delete_trainer(@trainer)
    render json: result
  end

  private

  def trainer_params
    params
      .require(:trainer)
      .permit(
        :id_number, 
        :first_name, 
        :last_name, 
        :birth_date, 
        :join_date, 
        :training_type_id
      )
  end
end
