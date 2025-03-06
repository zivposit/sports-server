class TraineeService
  def self.get_all_trainees
    Trainee.all
  end

  def self.find_by(id)
    Trainee.find_by(id)
  end

  def self.create_trainee(params)
    trainee = Trainee.new(params)
    return trainee if trainee.save

    { error: trainee.errors.full_messages }
  end

  def self.update_trainee(trainee, update_params)
    return trainee if trainee.update(update_params)

    { error: trainee.errors.full_messages }
  end

  def self.delete_trainee(trainee)
    trainee.destroy

    { success: "Trainee deleted" }
  end
end
