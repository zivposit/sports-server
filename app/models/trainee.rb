class Trainee < ApplicationRecord
  has_many :trainer_trainees, dependent: :destroy
  has_many :trainers, through: :trainer_trainees

  has_many :training_trainees, dependent: :destroy
  has_many :trainings, through: :training_trainees

  validates :id_number, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :birth_date, presence: true
end
