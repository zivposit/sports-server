# class TrainingTraineeService
#   def self.assign_trainees(training_id, trainee_ids)
#     current_trainee_ids = TrainingTrainee.where(training_id: training_id).pluck(:trainee_id)

#     trainees_to_remove = current_trainee_ids - trainee_ids
#     TrainingTrainee.where(training_id: training_id, trainee_id: trainees_to_remove).destroy_all if trainees_to_remove.any?

#     trainees_to_add = trainee_ids - current_trainee_ids
#     trainees_to_add.each do |trainee_id|
#       TrainingTrainee.create!(training_id: training_id, trainee_id: trainee_id)
#     end
#   end

#   def self.remove_trainee_from_training(id)
#     training_trainee = TrainingTrainee.find_by(id:)
#     return { error: "Training-Trainee association not found" } unless training_trainee

#     training_trainee.destroy
#     { success: "Trainee removed from training" }
#   end
# end
