class TrainingTrainee < ApplicationRecord
  belongs_to :training
  belongs_to :trainee

  validates :training_id, uniqueness: { scope: :trainee_id }
end