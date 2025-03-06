class ChangeDurationToIntegerInTrainings < ActiveRecord::Migration[8.0]
  def change
    change_column :trainings, :duration, :integer, using: 'duration::integer'
  end
end
