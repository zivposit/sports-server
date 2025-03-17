class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :update, :destroy]

  def index
    trainings = Training.includes(:training_type, :studio, :trainees).all
    render json: Serializer::TrainingSerializer.new(trainings).serializable_hash
  end

  def show
    render json: Serializer::TrainingSerializer.new(@training).serializable_hash
  end

  def create
    training_params_copy = training_params.dup
    trainee_ids = training_params_copy.delete(:trainees) || []
  
    training = Training.new(training_params_copy)
  
    if training.save
      training.assign_trainees(trainee_ids)
      render json: Serializer::TrainingSerializer.new(training).serializable_hash, status: :created
    else
      render json: { error: training.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    training_params_copy = training_params.dup
    trainee_ids = training_params_copy.delete(:trainees) || []

    if @training.update(training_params_copy)
      @training.assign_trainees(trainee_ids)
      render json: Serializer::TrainingSerializer.new(@training).serializable_hash, status: :ok
    else
      render json: { error: @training.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @training.destroy
    render json: { success: "Training deleted" }
  end

  private

  def set_training
    @training = Training.find_by(id: params[:id])
    render json: { error: "Training not found" }, status: :not_found unless @training
  end

  def training_params
    params
      .require(:training)
      .permit(
        :trainer_id,
        :studio_id,
        :date_time,
        :duration,
        :training_type_id,
        trainees: []
      )
  end
end
