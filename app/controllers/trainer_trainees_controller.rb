class TrainerTraineesController < ApplicationController
  # GET /trainers/:trainer_id/trainees
  def index
    result = TrainerTraineeService.get_trainees_for_trainer(params[:trainer_id])
  
    if result.is_a?(Hash) && result[:error]
      render json: result, status: :not_found
    else
      render json: Serializer::TraineeSerializer.new(result).serializable_hash
    end
  end
  

  # POST /trainer_trainees
  def create
    result = TrainerTraineeService.create_and_assign_trainee(params[:trainee][:trainer_id], trainee_params)
    if result.is_a?(Trainee)
      render json: Serializer::TraineeSerializer.new(result).serializable_hash, status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end


  # DELETE /trainer_trainees/:id
  def destroy
    result = TrainerTraineeService.remove_trainer_trainee(params[:id])
    render json: result
  end

  
  private

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
