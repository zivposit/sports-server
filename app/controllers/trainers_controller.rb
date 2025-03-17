class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :update, :destroy]

  def index
    trainers = Trainer.all
    render json: Serializer::TrainerSerializer.new(trainers).serializable_hash
  end

  def show
    render json: Serializer::TrainerSerializer.new(@trainer).serializable_hash
  end

  def create
    trainer = Trainer.new(trainer_params)

    if trainer.save
      render json: Serializer::TrainerSerializer.new(trainer).serializable_hash, status: :created
    else
      render json: { error: trainer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @trainer.update(trainer_params)
      render json: Serializer::TrainerSerializer.new(@trainer).serializable_hash, status: :ok
    else
      render json: { error: @trainer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @trainer.destroy
    render json: { success: "Trainer deleted" }
  end

  private

  def set_trainer
    @trainer = Trainer.find_by(id: params[:id])
    render json: { error: "Trainer not found" }, status: :not_found unless @trainer
  end

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
