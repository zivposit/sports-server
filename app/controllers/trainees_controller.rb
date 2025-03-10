class TraineesController < ApplicationController
  before_action -> { set_resource(TraineeService, :id, :trainee) }, only: [:show, :update, :destroy]

  def index
    trainees = TraineeService.get_all_trainees
    render json: Serializer::TraineeSerializer.new(trainees).serializable_hash
  end

  def show
    render json: Serializer::TraineeSerializer.new(@trainee).serializable_hash
  end

  def create
    result = TraineeService.create_trainee(trainee_params)

    if result.is_a?(Trainee)
      render json: Serializer::TraineeSerializer.new(result).serializable_hash, status: :created
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def update
    result = TraineeService.update_trainee(@trainee, trainee_params)

    if result.is_a?(Trainee)
      render json: Serializer::TraineeSerializer.new(result).serializable_hash, status: :ok
    else
      render json: { error: result }, status: :unprocessable_entity
    end
  end

  def destroy
    result = TraineeService.delete_trainee(@trainee)
    render json: { message: result }
  end

  private

  def trainee_params
    params.require(:trainee).permit(
      :id_number, 
      :first_name, 
      :last_name, 
      :birth_date, 
      :join_date
    )
  end
end
