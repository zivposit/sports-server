class TrainingService
  def self.get_all_trainings
    Training.all
  end

  def self.find_by(id)
    Training.find_by(id)
  end

  def self.create_training(params)
    trainee_ids = params.delete(:trainees) || [] 
    training = Training.new(params)
  
    if training.save
      TrainingTraineeService.assign_trainees(training.id, trainee_ids) unless trainee_ids.empty?
  
      return training 
    else
      return { error: training.errors.full_messages }
    end
  end
  

  def self.update_training(training, update_params)
    return training if training.update(update_params)

    { error: training.errors.full_messages }
  end

  def self.delete_training(training)
    training.destroy
    
    { success: "Training deleted" }
  end

  def self.get_trainings_by_trainer(trainer_id)
    Training.where(trainer_id:).includes(:training_type, :studio, :trainees)
  end
end
