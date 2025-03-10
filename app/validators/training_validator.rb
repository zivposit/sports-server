class TrainingValidator
  def self.validate_training_exists(training_id)
    Training.find_by(id: training_id) || { error: "Training not found" }
  end
end
