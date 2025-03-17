class TrainerTraineesController < ApplicationController
  before_action :set_trainer, only: [:index, :create]

  def index
    trainees = @trainer.trainees
    render json: Serializer::TraineeSerializer.new(trainees).serializable_hash
  end

  def create
    trainer_id = params[:trainee].delete(:trainer_id)
    trainee = Trainee.new(trainee_params) 
  
    if trainee.save
      TrainerTrainee.create(trainer_id: trainer_id, trainee_id: trainee.id)
      render json: Serializer::TraineeSerializer.new(trainee).serializable_hash, status: :created
    else
      render json: { error: trainee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    trainer_trainee = TrainerTrainee.find_by(id: params[:id])

    if trainer_trainee
      trainer_trainee.destroy
      render json: { message: "Trainee removed from trainer successfully" }, status: :ok
    else
      render json: { error: "Trainer-Trainee association not found" }, status: :not_found
    end
  end

  private

  def set_trainer
    trainer_id = params[:trainer_id] || params.dig(:trainee, :trainer_id)
    @trainer = Trainer.find_by(id: trainer_id)
    render json: { error: "Trainer not found" }, status: :not_found unless @trainer
  end

  def trainee_params
    params
      .require(:trainee)
      .permit(
        :id_number, 
        :first_name, 
        :last_name, 
        :birth_date, 
        :join_date
      )
  end
end
