module Serializer
  class TrainingSerializer < BaseSerializer

    attributes :id, :date_time, :duration, :trainer_id, :created_at, :updated_at

    belongs_to :studio, serializer: Serializer::StudioSerializer
    belongs_to :training_type, serializer: Serializer::TrainingTypeSerializer
    belongs_to :trainer, serializer: Serializer::TrainerSerializer
    has_many :trainees, serializer: Serializer::TraineeSerializer, through: :training_trainees
  end
end
