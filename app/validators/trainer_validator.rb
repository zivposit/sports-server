class TrainerValidator
  def self.validate_trainer_exists(trainer_id)
    Trainer.find_by(id: trainer_id) || { error: "Trainer not found" }
  end
end
