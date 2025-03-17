class TrainingTraineesController < ApplicationController
  def create
    training = Training.find_by(id: params[:training_id])
    return render json: { error: "Training not found" }, status: :not_found unless training

    trainee_ids = params[:trainee_ids] || []
    training.assign_trainees(trainee_ids)

    render json: { success: "Trainees assigned successfully" }, status: :created
  end

  def destroy
    training_trainee = TrainingTrainee.find_by(id: params[:id])

    if training_trainee
      training_trainee.destroy
    else
      render json: { error: "Training-Trainee association not found" }, status: :not_found
    end
  end
end
