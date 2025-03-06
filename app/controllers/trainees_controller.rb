class TraineesController < ApplicationController
  before_action -> { set_resource(TraineeService, :id, :trainee) }, only: [:show, :update, :destroy]

  def index
    render json: TraineeService.get_all_trainees
  end

  def show
    render json: @trainee
  end

  def create
    result = TraineeService.create_trainee(trainee_params)
    render json: result, status: result.is_a?(Trainee) ? :created : :unprocessable_entity
  end

  def update
    result = TraineeService.update_trainee(@trainee, trainee_params)
    render json: result, status: result.is_a?(Trainee) ? :ok : :unprocessable_entity
  end

  def destroy
    result = TraineeService.delete_trainee(@trainee)
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
