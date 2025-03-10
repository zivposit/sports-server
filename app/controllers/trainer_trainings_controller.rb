class TrainerTrainingsController < ApplicationController
  def index
    trainer_id = params[:trainer_id]
    trainings = TrainingService.get_trainings_by_trainer(trainer_id)

    render json: Serializer::TrainingSerializer.new(trainings).serializable_hash
  end
end
