class TrainerService
  def self.get_all_trainers
    Trainer.all
  end

  def self.find_by(id)
    Trainer.find_by(id)
  end

  def self.create_trainer(params)
    trainer = Trainer.new(params)
    return trainer if trainer.save

    { error: trainer.errors.full_messages }
  end

  def self.update_trainer(trainer, update_params)
    return trainer if trainer.update(update_params)

    { error: trainer.errors.full_messages }
  end

  def self.delete_trainer(trainer)
    trainer.destroy
    
    { success: "Trainer deleted" }
  end
end
