class TrainerTraineesController < ApplicationController
  # GET /trainers/:trainer_id/trainees
  def index
    result = TrainerTraineeService.get_trainees_for_trainer(params[:trainer_id])

    if result.is_a?(Hash) && result[:error]
      render json: result, status: :not_found
    else
      render json: result
    end
  end

  # POST /trainer_trainees
  def create
    result = TrainerTraineeService.assign_trainee(params[:trainer_id], params[:trainee_id])

    if result.is_a?(TrainerTrainee)
      render json: result, status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end

  # DELETE /trainer_trainees/:id
  def destroy
    result = TrainerTraineeService.remove_trainer_trainee(params[:id])
    render json: result
  end
end
