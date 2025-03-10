module Serializer
  class TrainerSerializer < BaseSerializer
    attributes :id, :first_name, :last_name, :birth_date, :id_number, :join_date, :created_at, :updated_at
  end
end
