class Trainer < ApplicationRecord
  has_many :trainer_trainees, dependent: :destroy
  has_many :trainees, through: :trainer_trainees

  has_many :trainings, dependent: :destroy

  validates :id_number, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :birth_date, presence: true
end
