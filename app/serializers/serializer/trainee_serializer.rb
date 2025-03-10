module Serializer
  class TraineeSerializer < BaseSerializer
    attributes :id, :id_number, :first_name, :last_name, :birth_date, :join_date, :created_at, :updated_at

    has_many :trainings, serializer: TrainingSerializer
  end
end
