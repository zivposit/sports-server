class TrainerTrainingsController < ApplicationController
  def index
    trainer_id = params[:trainer_id]
    trainings = TrainingService.get_trainings_by_trainer(trainer_id)

    if trainings.any?
      render json: Serializer::TrainingSerializer.new(trainings).serializable_hash
    else
      render json: { error: "No trainings found for this trainer" }, status: :not_found
    end
  end
end
