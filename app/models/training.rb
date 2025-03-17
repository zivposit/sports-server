class Training < ApplicationRecord
  belongs_to :trainer
  belongs_to :studio
  belongs_to :training_type
  
  has_many :training_trainees, dependent: :destroy
  has_many :trainees, through: :training_trainees

  validates :date_time, presence: true
  validates :duration, presence: true

  def assign_trainees(trainee_ids)
    self.training_trainees.where.not(trainee_id: trainee_ids).destroy_all 
  
    trainee_ids.each do |id|
      training_trainees.create!(trainee_id: id) unless training_trainees.exists?(trainee_id: id)
    end
  end
  end
