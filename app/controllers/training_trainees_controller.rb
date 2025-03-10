class TrainingTraineesController < ApplicationController
    
  def create
    result = TrainingTraineeService.assign_trainees(params[:training_id], params[:trainee_ids])

    if result.is_a?(Array)
      render json: result, status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end

  def destroy
    training_trainee = TrainingTrainee.find_by(id: params[:id])

    if training_trainee
      training_trainee.destroy
      head :no_content
    else
      render json: { error: "TrainingTrainee not found" }, status: :not_found
    end
  end
end
