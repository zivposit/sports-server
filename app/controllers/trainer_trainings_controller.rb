class TrainerTrainingsController < ApplicationController
  def index
    trainings = Training.where(trainer_id: params[:trainer_id])
                        .includes(:training_type, :studio, :trainees)

    render json: Serializer::TrainingSerializer.new(trainings).serializable_hash
  end
end
