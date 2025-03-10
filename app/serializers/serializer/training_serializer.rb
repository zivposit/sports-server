module Serializer
  class TrainingSerializer < BaseSerializer
    attributes :id, :date_time, :duration, :studio_id, :training_type_id, :trainer_id, :created_at, :updated_at

    has_one :studio, serializer: StudioSerializer
    has_one :trainer, serializer: TrainerSerializer
  end
end
