class TrainingMetadataController < ApplicationController

  def training_types
    training_types = TrainingType.all
    render json: Serializer::TrainingTypeSerializer.new(training_types).serializable_hash
  end

  def studios
    studios = Studio.all
    render json: Serializer::StudioSerializer.new(studios).serializable_hash
  end
end
