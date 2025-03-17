class ChangeDurationToIntegerInTrainings < ActiveRecord::Migration
  def change
    change_column :trainings, :duration, :integer, using: 'duration::integer'
  end
end
