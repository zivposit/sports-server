class TrainerTraineeService
  def self.get_trainees_for_trainer(trainer_id)
    trainer = TrainerValidator.validate_trainer_exists(trainer_id)
    return trainer if trainer.is_a?(Hash)

    trainer.trainees
  end

  def self.assign_trainee(trainer_id, trainee_id)
    # Validate trainer and trainee exist
    trainer = TrainerValidator.validate_trainer_exists(trainer_id)
    return trainer if trainer.is_a?(Hash)
    trainee = TraineeValidator.validate_trainee_exists(trainee_id)
    return trainee if trainee.is_a?(Hash)

    trainer_trainee = TrainerTrainee.new(trainer_id: trainer.id, trainee_id: trainee.id)
    return trainer_trainee if trainer_trainee.save

    { error: trainer_trainee.errors.full_messages }
  end

  def self.remove_trainer_trainee(id)
    trainer_trainee = TrainerTrainee.find_by(id: id)
    return { error: "Trainer-Trainee association not found" } unless trainer_trainee

    trainer_trainee.destroy
    { success: "Trainer-Trainee association deleted" }
  end

  def self.create_and_assign_trainee(trainer_id, trainee_params)
    trainer = Trainer.find_by(id: trainer_id)
    return { error: "Trainer not found" } unless trainer

    trainee = TraineeService.create_trainee(trainee_params)
    return { error: "Failed to create trainee" } unless trainee.is_a?(Trainee)

    assignment = assign_trainee(trainer.id, trainee.id)
    return { error: "Failed to assign trainee to trainer" } unless assignment.is_a?(TrainerTrainee)

    trainee 
  end
end
