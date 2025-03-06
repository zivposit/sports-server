class TrainingTraineeService
  def self.assign_trainees(training_id, trainee_ids)
    return { error: "Training ID and trainee IDs are required" } if training_id.blank? || trainee_ids.blank? || trainee_ids.empty?

    created_records = []
    trainee_ids.each do |trainee_id|
      training_trainee = TrainingTrainee.new(training_id:, trainee_id:)

      if training_trainee.save
        created_records << training_trainee
      else
        return { error: training_trainee.errors.full_messages }
      end
    end

    created_records
  end

  def self.remove_trainee_from_training(id)
    training_trainee = TrainingTrainee.find_by(id:)
    return { error: "Training-Trainee association not found" } unless training_trainee

    training_trainee.destroy
    { success: "Trainee removed from training" }
  end
end
