class CreateTrainingTrainees < ActiveRecord::Migration
  def change
    create_table :training_trainees do |t|
      t.references :training, null: false, foreign_key: true
      t.references :trainee, null: false, foreign_key: true

      t.timestamps
    end

    add_index :training_trainees, [:training_id, :trainee_id], unique: true
  end
end
