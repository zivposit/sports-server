class TrainerTrainee < ApplicationRecord
  belongs_to :trainer
  belongs_to :trainee

  validates :trainer_id, uniqueness: { scope: :trainee_id } 
end