class TraineeValidator
  def self.validate_trainee_exists(trainee_id)
    Trainee.find_by(id: trainee_id) || { error: "Trainee not found" }
  end
end
