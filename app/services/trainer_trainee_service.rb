class TrainerTraineeService
  def self.get_trainees_for_trainer(trainer_id)
    trainer = Trainer.find_by(id: trainer_id)
    return { error: "Trainer not found" } unless trainer

    trainer.trainees
  end

  def self.assign_trainee(trainer_id, trainee_id)
    trainer_trainee = TrainerTrainee.new(trainer_id:, trainee_id:)
    return trainer_trainee if trainer_trainee.save

    { error: trainer_trainee.errors.full_messages }
  end

  def self.remove_trainer_trainee(id)
    trainer_trainee = TrainerTrainee.find_by(id:)
    return { error: "Trainer-Trainee association not found" } unless trainer_trainee

    trainer_trainee.destroy
    { success: "Trainer-Trainee association deleted" }
  end
end
