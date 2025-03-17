class SeedCrossFitTrainingTypesAndStudios < ActiveRecord::Migration
  def up
    studios = [
      { name: "CrossFit Downtown" },
      { name: "Iron Strength Gym" },
      { name: "Functional Fitness Hub" },
      { name: "Powerhouse Box" }
    ]

    studios.each { |studio| Studio.find_or_create_by!(name: studio[:name]) }

    training_types = [
      { name: "WOD (Workout of the Day)" },
      { name: "Olympic Weightlifting" },
      { name: "Metcon (Metabolic Conditioning)" },
      { name: "Endurance Training" },
      { name: "Mobility & Recovery" }
    ]

    training_types.each { |type| TrainingType.find_or_create_by!(name: type[:name]) }
  end

  def down
    TrainingType.delete_all
    Studio.delete_all
  end
end
