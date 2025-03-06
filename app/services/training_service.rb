class TrainingService
  def self.get_all_trainings
    Training.all
  end

  def self.find_by(id)
    Training.find_by(id)
  end

  def self.create_training(params)
    training = Training.new(params)
    return training if training.save

    { error: training.errors.full_messages }
  end

  def self.update_training(training, update_params)
    return training if training.update(update_params)

    { error: training.errors.full_messages }
  end

  def self.delete_training(training)
    training.destroy
    
    { success: "Training deleted" }
  end
end
