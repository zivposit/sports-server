class TrainerTraineeValidator
  def self.validate_trainer_trainee_exists(trainer_id, trainee_id)
    trainer = TrainerValidator.validate_trainer_exists(trainer_id)
    return trainer if trainer.is_a?(Hash)

    trainee = TraineeValidator.validate_trainee_exists(trainee_id)
    return trainee if trainee.is_a?(Hash)

    TrainerTrainee.find_by(trainer_id:, trainee_id:) || { error: "Tr`ainer-Trainee association not found" }`
  end
end
