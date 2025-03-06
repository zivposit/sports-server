class Training < ApplicationRecord
  belongs_to :trainer
  belongs_to :studio
  
  has_many :training_trainees, dependent: :destroy
  has_many :trainees, through: :training_trainees

  validates :date_time, presence: true
  validates :duration, presence: true
end