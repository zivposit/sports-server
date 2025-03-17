class TraineesController < ApplicationController
  before_action :set_trainee, only: [:show, :update, :destroy]

  def index
    trainees = Trainee.all
    render json: Serializer::TraineeSerializer.new(trainees).serializable_hash
  end

  def show
    render json: Serializer::TraineeSerializer.new(@trainee).serializable_hash
  end

  def create
    trainee = Trainee.new(trainee_params)

    if trainee.save
      render json: Serializer::TraineeSerializer.new(trainee).serializable_hash, status: :created
    else
      render json: { errors: trainee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @trainee.update(trainee_params)
      render json: Serializer::TraineeSerializer.new(@trainee).serializable_hash, status: :ok
    else
      render json: { errors: @trainee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @trainee.destroy
    render json: { message: "Trainee deleted successfully" }, status: :ok
  end

  private

  def set_trainee
    @trainee = Trainee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Trainee not found" }, status: :not_found
  end

  def trainee_params
    params.require(:trainee)
      .permit(
        :id_number, 
        :first_name, 
        :last_name, 
        :birth_date, 
        :join_date
      )
  end
end
